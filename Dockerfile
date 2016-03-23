FROM node:4.3
MAINTAINER Josh Finnie "josh.finnie@trackmaven.com"

RUN apt-get -y update

# Install git, python & ruby.
RUN apt-get -y install git python python-dev python-pip ruby

# Update NPM
RUN npm install -g -U npm@3.8.2

# Install Gulp
RUN npm install -g gulp@3.8.11

# Install SASS
RUN gem install sass -v 3.4.13

# Install NPM packages
ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /code && cp -a /tmp/node_modules /code

# Install Python packages
ADD requirements.txt /tmp/requirements.txt
RUN cd /tmp && pip install -r requirements.txt

WORKDIR /code

CMD ["gulp"]
