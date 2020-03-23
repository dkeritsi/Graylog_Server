#!/bin/bash

#Graylog-------------------------------------------------------------------
#Note: Install Graylog
wget https://packages.graylog2.org/repo/packages/graylog-3.1-repository_latest.deb
sudo dpkg -i graylog-3.1-repository_latest.deb
sudo apt-get update && sudo apt-get install graylog-server
