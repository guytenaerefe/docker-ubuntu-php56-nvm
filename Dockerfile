# Draft version of zeus0 Dockerfile
# June 13th 2015 - Break-a-leg-day

# Use base ubuntu 14.04
FROM ubuntu:14.04

# Contact me
MAINTAINER Francesco de Guytenaere <guytenaere.fe@gmail.com>

# Lets get add-apt-repository and then add the php5.6 repo
#RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common
RUN add-apt-repository ppa:ondrej/php5-5.6
RUN apt-get update
RUN apt-get -y install sudo

# Added DEBIAN_FRONTEND since it would normally prompt for information
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --force-yes install mysql-client apache2 php5 libapache2-mod-php5 php5-mcrypt wget curl vim phpunit git build-essential libssl-dev

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

RUN echo "Getting nvm."

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.2/install.sh | bash

# Install node
RUN . ~/.nvm/nvm.sh && nvm install stable && nvm use stable

# Make it accessible, otherwise you will get node/npm not found errors.
RUN echo 'export PATH=$PATH:$HOME/.nvm/versions/node/v0.12.7/bin/' >> $HOME/.bashrc
