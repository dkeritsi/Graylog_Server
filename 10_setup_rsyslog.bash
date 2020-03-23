#!/bin/bash

#Setting up RCF5424--------------------------------------------------------
#***Warning this is to be run on Old Ubuntu Machine***

#Note: Send TCP and UDP messages to port 514
sudo echo '*.* @192.168.74.136:514;RSYSLOG_SyslogProtocol23Format' | sudo tee -a /etc/rsyslog.d/setting_up_port514_forRFC5424.conf
sudo echo '*.* @@192.168.74.136:514;RSYSLOG_SyslogProtocol23Format' | sudo tee -a /etc/rsyslog.d/setting_up_port514_forRFC5424.conf


#Note: Port 514 is a restricted lower port and need to redirect to 1514
sudo iptables -t nat -A PREROUTING -p tcp --dport 514 -j REDIRECT --to 1514
sudo iptables -t nat -A PREROUTING -p udp --dport 514 -j REDIRECT --to 1514

sudo iptables -L -n -t nat

#Note: Restart Rsyslog
sudo service rsyslog restart

echo $'\n\n***WARNING this is only run on non-Graylog Ubuntu Server***\n\n'

#Note: We also want to keep our IPTables' Rules saved
sudo apt-get install iptables-persistent
sudo netfilter-persistent save
