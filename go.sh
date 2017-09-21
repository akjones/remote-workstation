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

ansible-playbook -i "localhost," -c local $playbook
