#!/bin/bash

PATCH_FIND = 'http://mirror.centos.org/centos/$releasever/SCL/$basearch'
PATCH_REPLACE = 'http://mirror.centos.org/centos/$releasever/sclo/$basearch/sclo'

echo '>>> Hello Master! I am setting you up now\n'

cat assets/welcome-text.txt

echo '>>> Grabbing your configuration file\n\n'

CURRENT=`pwd`
source init.cfg

echo '>>> Resetting Vagrant\n'

vagrant destroy -f

echo '>>> Making the APP Directory\n'

cd ../
mkdir app
cd $CURRENT

echo ">>> Setting up your box: ${virtual_box_name}\n\n"

rm puphpet/config.yaml.bak
rm puphpet/config.yaml
cp puphpet/original-config.yaml puphpet/config.yaml

if [ ! -f puphpet/config.yaml.bak ]; then
    echo ">>> Configuring puppet... Old configuration file will be saved as puphpet/config.yaml.bk\n"
    sed -i.bak s/{VIRTUAL_BOX_NAME}/${virtual_box_name}/g puphpet/config.yaml
    sed -i.bak s/{VM_IP_ADDRESS}/${local_ip_address}/g puphpet/config.yaml
    sed -i.bak s/{LOCAL_HOSTNAME}/${local_hostname}/g puphpet/config.yaml
fi

echo ">>> Time for the long hard part.... please be patient\n\n"

vagrant up

echo ">>> Master... we are now ready.  Update your machines hosts file"

echo "\n"

echo ">>> Cleaning up"

cd ../app
rm -rf *
cd $CURRENT

if [ -z "$(ls -A $DIR)" ]; then
    if [ -z "${repository}" ]; then
        echo ">>> No repository to get"
        cp assets/index.html ../app/
    else
        echo ">>> Cloning Repository"
        cd ../app
        git clone ${repository} .
    fi
fi

echo "/etc/hosts >> ${local_ip_address} ${local_hostname}"