#!/bin/bash

#Graylog-------------------------------------------------------------------

#Note: Edit Graylog Conf File 

#Note: Edit the Password First
GraylogConf_filepath='/etc/graylog/server/server.conf'
PASSGEN=$(pwgen -N 1 -s 96)
echo $PASSGEN

Head='password_secret = '
PASSGEN_Head=$Head$PASSGEN

sudo sed -i "s/^password_secret =/$PASSGEN_Head/g" $GraylogConf_filepath 

#Note: Edit now the Hash based on the Password
HashGen=$(echo -n $PASSGEN | shasum -a 256)
HashGen=$(echo -n $HashGen | head -c -1)
echo $HashGen

Head_of_Hash='root_password_sha2 = '
Hash_Head=$Head_of_Hash$HashGen

sudo sed -i "s/^root_password_sha2 =/$Hash_Head/g" $GraylogConf_filepath 




