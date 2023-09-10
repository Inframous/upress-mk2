#!/bin/bash

KNOWN_HOSTS_FILE="$HOME/.ssh/known_hosts"

if [[ -f $KNOWN_HOSTS_FILE ]]; then

    gsed -i '/^10\.5\.5\.95/d' $KNOWN_HOSTS_FILE
    sleep 1
    gsed -i '/^10\.5\.5\.96/d' $KNOWN_HOSTS_FILE
    sleep 1
    gsed -i '/^10\.5\.5\.97/d' $KNOWN_HOSTS_FILE
    sleep 1
    gsed -i '/^10\.5\.5\.98/d' $KNOWN_HOSTS_FILE

else
    echo "Error: $KNOWN_HOSTS_FILE does not exist."
fi

cd terraform 
terraform apply -auto-approve
cd ..

cd ansible

ssh-keyscan -t rsa 10.5.5.95 >> ~/.ssh/known_hosts
sleep 3
ssh-keyscan -t rsa 10.5.5.96 >> ~/.ssh/known_hosts
sleep 3
ssh-keyscan -t rsa 10.5.5.97 >> ~/.ssh/known_hosts
sleep 3
ssh-keyscan -t rsa 10.5.5.98 >> ~/.ssh/known_hosts
sleep 3

ansible-playbook -i hosts --private-key ~/.ssh/keys/M1 stack.yaml


