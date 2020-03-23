#!/bin/bash

#Elasticsearch-------------------------------------------------------------------

#Note: Modify Config File .yml 
YMLfilepath='/etc/elasticsearch/elasticsearch.yml'
sudo chmod 777 $YMLfilepath
sudo sed -i 's/^#cluster.name: my-application/cluster.name: graylog \naction.auto_create_index: false/g' $YMLfilepath
sudo chmod 660 $YMLfilepath

#Note: Start Elasticsearch
sudo systemctl daemon-reload
sudo systemctl enable elasticsearch.service 
sudo systemctl restart elasticsearch.service 
