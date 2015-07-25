# Draft version of zeus0 Dockerfile
# June 13th 2015 - Break-a-leg-day

# Use base ubuntu 14.04
FROM ubuntu:14.04

# Contact me
MAINTAINER Francesco de Guytenaere <guytenaere.fe@gmail.com>

# Lets get add-apt-repository and then add the php5.6 repo
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common
RUN add-apt-repository ppa:ondrej/php5-5.6
RUN apt-get update
RUN apt-get -y install sudo


RUN DEBIAN_FRONTEND=noninteractive apt-get -y --force-yes install mysql-client apache2 php5 libapache2-mod-php5 php5-mcrypt wget curl phpunit git build-essential libssl-dev

# Getcomposer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

#change it to your required node version
ENV NODE_VERSION 0.12.7

#needed by nvm install
ENV NVM_DIR /usr/local/nvm

# NVM
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | NVM_DIR=/usr/local/nvm bash

#install the specified node version and set it as the default one, install the global npm packages
RUN . /usr/local/nvm/nvm.sh && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION && npm install -g bower && npm install -g gulp

#RUN echo 'export PATH=$PATH:$NVM_DIR/.nvm/versions/node/$NODE_VERSION/bin' >> /home/dockworker/.bashrc

