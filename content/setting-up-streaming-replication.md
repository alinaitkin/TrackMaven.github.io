# So you want another PostgreSQL database? (part 1)
## Streaming replication with PostgreSQL 9.3 on Amazon EC2

They grow up so fast, don't they? It seems like just yesterday you were setting up your PostgreSQL server and tweaking settings you barely understood to try to get the most out of your database. But now, you've got a lot more data and your traffic continues to rise, and you've decided it's time your database had a few companions to help it out. Fortunately, PostgreSQL 9 makes it rather simple to set up a master database that can handle writes, and any number of slave databases which are read-only, stay in sync with the master, and can be promoted to the master in the event of failure on your master database.

There are a lot of factors that come into play when you decide to scale your database infrastructure and they vary wildly from project to project. These are outside the scope of this post, and I'm is going to assume you have already decided on a master/slave database setup. 

## So what are we going to do?
We are going to take our current single-database setup and turn it into a master database with a single slave following the master using streaming replication and WAL archiving. We will perform all read operations from the slave and all write operations to the master. The slave will be able to take over the role of master at any moment we need it to, and is thus known as a ***hot standby*** server.

## How it all works: understanding streaming replication
Everything you do to your database (inserts, updates, deletes, alter table, etc.) is first recorded on disk in what is called a Write-Ahead Log, or WAL for short. Only once the WAL has been updated will any change be made to the database. In the event of a crash, you are able to recover to the exact moment of the crash by replaying the WAL files and reconstructing all changes that have been made to the database. This is the core of streaming replication.

On every write made to the master, a WAL file is written to. The WAL file is then forwarded along to the slave. Our slave server, which operates in a kind of permanent recovery mode, is continuously listening to the master and will reconstruct all changes made by reading the master's WAL. By doing so, our slave database stays in sync with the master nearly instantaneously.

It is important to note that the forwarding of WAL files is done only after a transaction has been committed to the master and thus there will be a small period, generally less than one second, where a change has been made to the master and is not yet reflected on the slave.


## Setting it all up
We use [WAL-E](https://github.com/wal-e/wal-e) to store backups of our database and WAL files in S3 for additional security against failure. Its setup warrants its own writeup, and is not necessary for streaming replication. I have left the WAL-E commands in the instructions below, since there is no "right" answer for how and where you store your WAL files. For instance, you can certainly store them locally on the master and rsync them to the slave. It's incredibly easy to set up, but if your master goes down and you can't access that server, you may not be able to have a fully current slave to promote. All that changes is the `archive_command` on the master and the `restore_command` on the slave. These can be set to anything you need, so long as the master is shipping its WALs to a place where the slave can fetch them.

Alright, let's get started.

### Perform on both master and slave
* Launch two EC2 instances running Ubuntu Server 14.04 and install PostgreSQL
  * `sudo apt-get update && sudo apt-get upgrade`
  * `sudo apt-get install postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3`
  * When installed, PostgreSQL will create a user named postgres from which all further commands need to be run from. To take over the postgres user, we must first give it a password: `sudo passwd postgres`
  * Become the postgres user: `su - postgres` and enter the password from the previous step

### Perform on both master and slave
* We need the two servers to be able to communicate with each other via ssh without passwords for WAL files to be received by the slave (and sent, in the case of the slave being promoted to master if master goes down). **This must all be done as the postgres user.**
  * `ssh-keygen -t rsa`
  * `eval $('ssh-agent')`
  * `ssh-add`
  * Create `authorized_keys` file in ~/.ssh/
  * Copy other server's id_rsa.pub into `authorized_keys`
  * Test correct functionality: `ssh <IP_ADDRESS_OF_OTHER_SERVER>`
    * It's important that ssh works from postgres user to postgres user with no parameters given. If my master server's IP is 1.2.3.4 and my slave's is 5.6.7.8, then I should be able to do this with no problems: `postgres@ip-1-2-3-4:~$ ssh 5.6.7.8`

### Perform only on master
* Create a user with superuser and replication privileges: 
`psql -c "CREATE USER replicator SUPERUSER REPLICATION LOGIN CONNECTION LIMIT 1 ENCRYPTED PASSWORD '<PASSWORD>';"`
  * In the event that the psql command says that authentication failed, edit /etc/postgresql/9.3/main/pg_hba.conf and edit the line (likely top line) that says 
`local all postgres md5` to say `local all postgres peer` and restart the server with 
`service postgresql restart`
* Edit /etc/postgresql/9.3/main/pg_hba.conf: Add `host replication replicator <IP_OF_SLAVE>/32 md5` to the bottom of the file.
* Edit /etc/postgresql/9.3/main/postgresql.conf and add the following options **(ensure they are not set anywhere else in the config file already)**:
```
hot_standby = 'on'
max_wal_senders = 5
wal_level = 'hot_standby'
archive_mode = 'on'
archive_command = 'envdir /etc/wal-e.d/env /usr/local/bin/wal-e wal-push %p'
archive_timeout = 60
listen_addresses = '*'
```
* Restart the server: `service postgresql restart`

### Perform only on slave
* Become the postgres user: `su - postgres`
* Stop the server: `service postgresql stop`
* Edit /etc/postgresql/9.3/main/postgresql.conf and add the following options **(ensure they are not set anywhere else in the config file already)**:
```
hot_standby = 'on'
max_wal_senders = 5
wal_level = 'hot_standby'
```
* Create a new script file: `vim replication_setup` and place the following commands in it.
```
echo Stopping PostgreSQL
service postgresql stop

echo Cleaning up old cluster directory
rm -rf /var/lib/postgresql/9.3/main

echo Starting base backup as replicator
pg_basebackup -h <IP_OF_MASTER> -D /var/lib/postgresql/9.3/main -U replicator -v -P

echo Writing recovery.conf file
bash -c "cat > /var/lib/postgresql/9.3/main/recovery.conf <<- _EOF1_
  standby_mode = 'on'
  primary_conninfo = 'host=<IP_OF_MASTER> port=5432 user=replicator password=<PASSWORD>'
  trigger_file = '/tmp/postgresql.trigger'
  restore_command = 'envdir /etc/wal-e.d/env /usr/local/bin/wal-e wal-fetch "%f" "%p"'
_EOF1_
"

echo Starting PostgreSQL
service postgresql start
```
* Allow execution of that script: `chmod +x replication_setup`
* Run the script: `./replication_setup`
* Verify that your slave is working. Check the log at /var/log/postgresql/postgresql-9.3-main.log. You should see output similar to the following.
```
2014-05-02 21:12:25 UTC LOG:  consistent recovery state reached at 0/450006C8
2014-05-02 21:12:25 UTC LOG:  database system is ready to accept read only connections
2014-05-02 21:12:25 UTC LOG:  started streaming WAL from primary at 0/45000000 on timeline 1
```
* You can also check that the WAL send/receive processes are running:
  * Master: `ps -ef | grep sender`
  * Slave: `ps -ef | grep receiver`

### Both master and slave
* Finally, add the IP addresses of your EC2 instances so that they can see your fancy new databases: `vim /etc/postgresql/9.3/main/pg_hba.conf` and add this line to the bottom.
```
host    <user_name>       <db_name>     <IP_ADDRESS>/32           md5
```
* Restart both servers: `service postgresql restart`

* Celebrate