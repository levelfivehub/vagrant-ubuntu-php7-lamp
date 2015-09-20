#!/bin/bash

cat welcome-text.txt

echo '>>> Hello Master! I am setting you up now\n'

echo '>>> Resetting Vagrant\n'

vagrant destroy -f

echo '>>> Get the APP files\n'

cd ../
mkdir app
cd infrastructure

echo '>>> Grabbing your configuration file\n\n'

source init.cfg

echo ">>> Setting up your box: ${virtual_box_name}\n\n"

rm puphpet/config.yaml.bk
git checkout -- puphpet/config.yaml

if [ ! -f /puphpet/config.yaml.bak ]; then
    echo ">>> Configuring puppet... Old configuration file will be saved as puphpet/config.yaml.bk\n"
    sed -i.bak s/{VIRTUALBOX_NAME}/${virtual_box_name}/g puphpet/config.yaml
    sed -i.bak s/{VM_IP_ADDRESS}/${local_ip_address}/g puphpet/config.yaml
    sed -i.bak s/{LOCAL_HOSTNAME}/${local_hostname}/g puphpet/config.yaml
fi

echo ">>> Time for the long hard part.... please be patient\n\n"

vagrant up

echo ">>> Master... we are now ready.  Update your machines hosts file"

echo "\n"

echo ">>> Cleaning up"

rm -rf .git

echo "/etc/hosts >> ${local_ip_address} ${local_hostname}"