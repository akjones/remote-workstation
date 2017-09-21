#!/bin/bash

which ansible

if [ ! $? -eq 0 ]; then
    sudo add-apt-repository ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install -y ansible
fi;

if  [ "$1" != "" ]; then
    playbook=$1
else
    playbook=workstation.sh
fi

if [ "${UBUNTU_PASSWORD}" != "" ]; then
    extra_vars="--extra-vars ubuntu_password=${UBUNTU_PASSWORD}"
fi

ansible-playbook -i "localhost," -c local $playbook $extra_vars
