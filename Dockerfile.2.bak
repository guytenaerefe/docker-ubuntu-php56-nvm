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

# add user dockworker and use it to install node/npm and run the app
RUN useradd --home /home/dockworker -m -U -s /bin/bash dockworker

#allow some limited sudo commands for user `node`
RUN echo 'Defaults !requiretty' >> /etc/sudoers; \
    echo 'dockworker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers;

    #run all of the following commands as user node from now on
USER dockworker

RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash

#change it to your required node version
ENV NODE_VERSION 0.12.7

#needed by nvm install
ENV NVM_DIR /home/dockworker/.nvm

#install the specified node version and set it as the default one, install the global npm packages
RUN . ~/.nvm/nvm.sh && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION && npm install -g bower forever --user "dockworker" && npm install -g gulp forever --user "dockworker"

RUN echo 'export PATH=$PATH:/home/dockworker/.nvm/versions/node/$NODE_VERSION/bin' >> /home/dockworker/.bashrc

