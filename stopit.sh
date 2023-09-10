#!/bin/bash

cd terraform 
terraform destroy -auto-approve
cd ..

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
