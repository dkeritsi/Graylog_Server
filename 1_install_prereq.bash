#!/bin/bash
set -e

#Prerequisites-----------------------------------------------------------------
sudo apt-get update && sudo apt-get upgrade

if ! sudo apt-get install apt-transport-https openjdk-8-jre-headless uuid-runtime pwgen
then
#Note: Need to enable universe repository
echo 'Install Universe Repository'
sudo add-apt-repository universe
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install apt-transport-https openjdk-8-jre-headless uuid-runtime pwgen
fi

