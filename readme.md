# README #

This is a standalone container for automated Wercker builds that need PHP 5.6, composer and NVM. This version does not include docker-compose.

## Prerequisites ###

* Have docker installed

### What does this repo contain? ###

* `Dockerfile` for a basic ubuntu14.04 with apache2 + php5 image + nvm (npm + node) (+curl,wget,vim)

### How do I get set up? ###

If you hadn't already:

* Install docker (preferably not as root)
* Download this repo
* In case you use this for local development (would use another box.), set a USER in the Dockerfile so your local filesystem does not accidently get files created by user `root`.

### Who do I talk to? ###

* Francesco <guytenaere.fe@gmail.com>
