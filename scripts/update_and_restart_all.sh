#!/bin/bash

# check if it was run as root/sudo (because we will need to stop and start the server)
if [[ $EUID -ne 0 ]]; then
    echo "ERROR: This must be run as root"
    exit 1
fi

# time to sleep between starting a server and shutting down the next one
RESTART_TIME=600 # s

# server paths
SERVER_TheIsland_1=/home/soulivore/Ark/servers/server_TheIsland_1
SERVER_Ragnarok_1=/home/soulivore/Ark/servers/server_Ragnarok_1

# do the restarts
/home/soulivore/Ark/scripts/update_and_restart.sh "$SERVER_TheIsland_1" && sleep "$RESTART_TIME"
/home/soulivore/Ark/scripts/update_and_restart.sh "$SERVER_Ragnarok_1"



## mods
#SUPER_SPYGLASS=793605978
#
#python3 Ark_Mod_Downloader.py --modids "$SUPER_SPYGLASS" --workingdir "$SERVER_TheIsland_1" --steamcmd "/usr/games" --namefile
#
# old commands for running the mod downloader:
# python3 Ark_Mod_Downloader.py --modids "793605978" --workingdir "/home/soulivore/Ark/servers/server_Ragnarok_1/" --steamcmd "/usr/games" --namefile
# python3 Ark_Mod_Downloader.py --modids "793605978" --workingdir "/home/soulivore/Ark/servers/server_TheIsland_1" --steamcmd "/usr/games" --namefile



