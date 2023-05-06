#!/bin/bash

#if [[ $EUID -ne 0 ]]; then
#    echo "ERROR: This must be run as root"
#    exit 1
#fi


echo "this is test1"
whoami
echo $1

#/home/soulivore/Ark/scripts/old/test2.sh "$@"
/home/soulivore/Ark/scripts/old/test2.sh "asdf"

#su -c '/home/$USER/Ark/scripts/test2.sh "$@"' soulivore 
#exec sudo -u "soulivore" /home/soulivore/Ark/scripts/test2.sh "$@"

