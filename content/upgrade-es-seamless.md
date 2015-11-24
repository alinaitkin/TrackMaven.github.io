Title: Upgrade Elasticsearch cluster software and hardware seamlessly
Date: 2015-11-24
Category: DevOps
Tags: elasticsearch, how-to
Slug: upgrade-es-seamlessly
Author: John Young
Avatar: john-young

## Cluster Upgrades

Our decision to begin using Elasticsearch came from a fairly typical use case for the popular distributed data store. We had hundreds of millions of pieces of content, and we wanted to support text search across them. As we set out to migrate our architecture from a relatively simple Postgres setup to include indexing all of our documents into Elasticsearch, we did what everyone does: we played around with Elasticsearch and made some educated guesses about the hardware we would need to support our needs. And, as so often happens, we underestimated.

Our biggest problem was with disk space usage. Indexing our dataset took up far more space than we had anticpated, and we needed to increase the size of the attached AWS EBS volumes on our instances. Slightly less pressing than our disk usage was our heap usage, which made us want to increase the memory of each node so that we could allocate more heap space (reminder that it's [very important](https://www.elastic.co/guide/en/elasticsearch/guide/current/heap-sizing.html#compressed_oops) to keep your heap size below 30.5gb). All the while, we were several versions behind: running 1.3.2 at the time of 1.7.0's release. We figured the best course of action was to tackle all three of these problems at the same time, without any cluster downtime.

Some caveats before we begin:
 - This only applies to minor version upgrades, like 1.x to 1.x, or 2.x to 2.x. Major version upgrades, like 1.x to 2.x, are more complicated and require a full cluster restart.
 - If you only have one master-eligible node, then taking it down will make your cluster very sad. If you're using the more recommended number of 3 master-eligible nodes, a new one will be elected seamlessly as you take each down individually for upgrades
 - Our infrastructure is hosted on AWS, but the underlying principles are the same across any hardware cluster
 - If you don't already have backups of your production data, do that before thinking about any of this


## Out with the old, in with the new

From a high level, our process looks like this:
* Launch a new, larger EC2 instance based off our current node AMIs, with larger EBS volumes attached
* Upgrade this instance's version of Elasticsearch
* Create a new AMI for our upgraded instance
* Join this new node to our production cluster
* Re-allocate all shards off an older, non-upgraded node
* Allow the cluster to rebalance itself
* Once all nodes have been shipped off the old node, shut it down
* Repeat this process of spawning new instances based off the upgraded AMI until all nodes have been upgraded

Creating AMIs, launching instances based off of them, and changing instance/volume sizes are steps specific to AWS, and outside the scope of this post. There is a ton of great documentation around these things already available, so I will be skipping over anything detailed on them. Let's get started.

First, launch a new instance with the specs you want. It makes things easier if you base this instance off an image of a working Elasticsearch node, so that your config settings are retained and you do not forget to install any required dependencies. You don't want this node to join your cluster yet, as you still need to upgrade it. We prevented this by simply not giving it access to our Elasticsearch AWS security groups. Now, let's upgrade our version.

Elasticsearch has good [documentation](https://www.elastic.co/guide/en/elasticsearch/reference/current/rolling-upgrades.html) around how to perform a rolling version upgrade. It's best to follow their steps closely. However, since the node we're upgrading aren't a part of our cluster yet, it's much simpler. We have Elasticsearch installed from their tar packages, so we download the latest version, and place it in a directory next to our current version. We also manage our Elasticsearch processes with `supervisor`, so we shut it down as well.

* Stop supervisor
 - `sudo service supervisor stop`
* Download and extract the new version
 - `wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.0.tar.gz && tar xvzf elasticsearch-1.7.0.tar.gz && rm -f elasticsearch-1.7.0.tar.gz && sudo mv elasticsearch-1.7.0 /opt/elasticsearch-1.7`
* Copy over your previous config settings
 - `sudo rm /opt/elasticsearch-1.7/config/elasticsearch.yml`
 - `sudo mv /opt/elasticsearch/config/elasticsearch.yml /opt/elasticsearch-1.7/config/`
* Delete the previous version and put the new version in its place
 - `sudo rm -rf /opt/elasticsearch`
 - `sudo mv /opt/elasticsearch-1.7 /opt/elasticsearch`
* Restart supervisor
 - `sudo service supervisor start`

With this newly upgraded node, we create an AMI of this instance so that we don't need to keep performing this manual upgrade process. All new instances going forward should be based off this upgraded image.

Now, it's time to join this node to the cluster. We add the necessary security groups and watch our cluster health (`localhost:9200/_cluster/health?pretty`) show us what's happening. We should see a new data node join the cluster, and our cluster health change from `green` to `yellow`. The `yellow` state happens because of our mismatched version numbers in the cluster. Primary shards assigned to the newer version will not allocate their replica shards to older versioned nodes. With only one upgraded node, we will have unassigned replica shards. This is remedied once we have two upgraded nodes in the cluster, and health will again return to `green`.

Once our new node has joined the cluster successfully, it's time to shut down one of our old nodes.

* Re-allocate all shards off the node
```
curl -XPUT localhost:9200/_cluster/settings -d '{
    "transient" :{
        "cluster.routing.allocation.exclude._ip" : "<IP Address>"
    }
}'
```
* Wait for the cluster to re-balance itself by waiting for `relocating_shards` to go to 0
 - `curl localhost:9200/_cluster/health?pretty`
* Shut down the node
 - Stop and/or terminate the instance, kill the Elasticsearch process, whatever you want to do to decommision this node

 That's it. From here, you can spawn an additional instance based off the already upgraded image, and repeat the process of disabling allocation on an older node and decommissioning them one by one. The same process applies to all nodes, whether master or client or data.

 Enjoy your new cluster!