#!/bin/bash

cat welcome-text.txt

echo '>>> Hello Master! I am setting you up now\n'

echo '>>> Resetting Vagrant\n'

vagrant destroy

echo '>>> Grabbing your configuration file\n\n'

source init.cfg

echo ">>> Setting up your box: ${virtual_box_name}\n\n"

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

cd ../app && rm -rf *

echo ">>> Let's get composer"

php -r "readfile('https://getcomposer.org/installer');" | php

echo "\n"

cp ../infrastructure/application-assets/composer.json .

echo ">>> Installing composer components that we need"

composer install

cp ../infrastructure/application-assets/package.json .

npm install

echo ">>> Installing Node and components that we need"

cp ../infrastructure/application-assets/bower.json .

bower install

npm install -g bower

echo ">>> Installing Bower and components that we need"

cp -r ../infrastructure/application-assets/ .

echo "/etc/hosts >> ${local_ip_address} ${virtual_box_name}"