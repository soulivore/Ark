#!/bin/bash

#if [[ $EUID -ne 0 ]]; then
#    echo "ERROR: This must be run as root"
#    exit 1
#fi


echo "this is test1"
echo $1

#/home/$USER/Ark/scripts/test2.sh "$@"
#su -c '/home/$USER/Ark/scripts/test2.sh "$@"' soulivore 
exec sudo -u "soulivore" /home/soulivore/Ark/scripts/test2.sh "$@"
