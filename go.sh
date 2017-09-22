#!/bin/bash

which ansible

if [ ! $? -eq 0 ]; then
    sudo add-apt-repository ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install -y ansible
fi;

if  [ "$1" != "" ]; then
    prefix=$1
    playbook="$1/workstation.yml"
    requirements="$1/requirements.yml"
else
    playbook=workstation.yml
    requirements=requirements.yml
fi

if [ "${UBUNTU_PASSWORD}" != "" ]; then
    extra_vars="--extra-vars ubuntu_password=${UBUNTU_PASSWORD}"
fi

set -e

ansible-galaxy install -r $requirements
ansible-playbook -i "localhost," -c local $playbook $extra_vars
