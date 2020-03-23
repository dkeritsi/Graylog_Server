#!/bin/bash

#Graylog-------------------------------------------------------------------

#Note: Edit the Web Interface
#****WARNING**** This IP address is hard-coded and need to change this from machine to machine

GraylogConf_filepath='/etc/graylog/server/server.conf'
IP_address_US='192.168.74.136:9000'
Head_IP='http_bind_address = '
IP_address_US_Head=$Head_IP$IP_address_US
sudo sed -i "s/^#http_bind_address = 127.0.0.1:9000/$IP_address_US_Head/g" $GraylogConf_filepath 

#Note: Personal Setting I set up the time zone to be EST with root_timezone = EST

#Note: Enable Graylog
sudo systemctl daemon-reload
sudo systemctl enable graylog-server.service
sudo systemctl start graylog-server.service




