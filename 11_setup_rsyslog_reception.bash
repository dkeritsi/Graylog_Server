#!/bin/bash

#Rsyslog Reception Setup-------------------------------------------------------------------

#Note:Rsyslog.conf File
RSYSLOGCONF='/etc/rsyslog.conf'
sudo sed -i 's/^#module(load="imudp")/module(load="imudp")/g' $RSYSLOGCONF
sudo sed -i 's/^#module(load="imtcp")/module(load="imtcp")/g' $RSYSLOGCONF
sudo sed -i 's/^#input(type="imudp" port="514")/input(type="imudp" port="514")/g' $RSYSLOGCONF
sudo sed -i 's/^#input(type="imtcp" port="514")/input(type="imtcp" port="514")/g' $RSYSLOGCONF

#Note: Make sure all IPtable Rules on the Graylog Server is clear
echo $'\n\n***----Make sure IPtable Rules are clear----***\n\n'
sudo iptables -L -n -t nat

#Note: Not sure why I am doing this command but I saw it on a video and I am not sure why we are putting this command on our Grayserver (instead of a client).
#Note: We are also setting port 1514 just like the video had it, but I guess we could also do 514 and use IPtables to route.
sudo echo '*.* @192.168.74.136:1514;RSYSLOG_SyslogProtocol23Format'|sudo tee -a $RSYSLOGCONF

#Note: Restart Rsyslog 
sudo service rsyslog restart




