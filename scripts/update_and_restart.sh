#!/bin/bash

# check if the script was run with one argument
# $# is the number of arguments passed to the script
# -eq is the equality numerical comparison operator 
#   (as opposed to = or == for strings)
# -ge is the "greater than or equal to" numerical comparison operator
if [ $# -eq 0 ] || [ $# -ge 2 ]; then
    echo "ERROR: script must be passed one argument, which is the filepath to the server's install directory"
    exit 1
fi

# check if it was run as root/sudo (because we will need to stop and start the server)
if [[ $EUID -ne 0 ]]; then
    echo "ERROR: This must be run as root"
    exit 1
fi

# get the server's name
dir=${1%*/} # removes trailing slashes
dirname="${dir##*/}" # just the bottom-level directory name without the path

echo "stopping server..."
systemctl stop $dirname.service

scriptarg=$@ su -c '/home/$USER/Ark/scripts/update_server.sh "$scriptarg"' soulivore

echo "restarting server..."
#systemctl start $dirname.service

