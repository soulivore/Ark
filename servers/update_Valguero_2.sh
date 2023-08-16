#!/bin/bash

SERVER_PATH=/home/$USER/Ark/servers/server_Valguero_2/

# mods
#SUPER_SPYGLASS=793605978

echo "updating server..."
steamcmd +force_install_dir "$SERVER_PATH" +login anonymous +app_update 376030 +quit

#echo "updating mods..."
#python3 /home/$USER/Ark/scripts/Ark_Mod_Downloader.py --modids "$SUPER_SPYGLASS" --workingdir "$SERVER_PATH" --steamcmd "/usr/games" --namefile
