#!/bin/sh

if [ -z "$1" ]; then 
    echo '\033[0;31m'"    please set public key as varible"
    echo '\033[0;34m'"    for example: sh install.sh .ssh/id_rsa.pub"
else
    ansible-playbook -i ansible/inventories/production ansible/box.yml --private-key $1
fi
