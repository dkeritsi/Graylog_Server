#!/bin/bash

#Graylog-------------------------------------------------------------------

#Note: Extract the Graylog Password from the .conf file after Web Interface works 

GraylogConf_filepath='/etc/graylog/server/server.conf'
Password=$(cat $GraylogConf_filepath | grep -i "password_secret")
echo $Password

#Note: The next line is commented out because mounting in VMware is problematic
#echo $Password > /mnt/hgfs/password_for_Graylog.txt

#Note: Instead, we will save the file as .txt and set up SSH 
echo $Password > $HOME/password_for_Graylog.txt
sudo chmod 777 $HOME/password_for_Graylog.txt

#Note: Need to setup SSH in order to take the password and transfer it
#Note: We will use SCP, which is part of SSH, to transfer the file, but we only use SSH to look at the filename and directory while from Kali

sudo apt update
sudo apt install openssh-server

#Note: Do These steps on Kali after ensuring that openSSH is running
#Note: Create directory in Kali. For me, mkdir project3d/
#Note: While on Kali, type scp -v dkeritsi@192.168.74.136:/home/dkeritsi/* ./project3d/ or just transfering the "password_for_Graylog.txt" is fine too instead of all the files.
