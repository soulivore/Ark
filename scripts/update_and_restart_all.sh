#!/bin/bash

# check if it was run as root/sudo (because we will need to stop and start the server)
if [[ $EUID -ne 0 ]]; then
    echo "ERROR: This must be run as root"
    exit 1
fi

NONROOTUSER=soulivore

STOP_TIME=60
START_TIME=600

# place list of servers to be serviced here
# you might not want to do this with every server
for servername in TheIsland_1 Ragnarok_1; do
    
    echo "Updating and restarting $servername"

    echo "stopping server..."
    systemctl stop "server_$servername.service"
    sleep $STOP_TIME

    su -c "/home/$NONROOTUSER/Ark/servers/update_$servername.sh" $NONROOTUSER

    echo "restarting server..."
    systemctl start "server_$servername.service"
    sleep $START_TIME

done
