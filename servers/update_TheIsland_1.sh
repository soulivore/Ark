#!/bin/bash

SERVER_PATH=/home/$USER/Ark/servers/server_TheIsland_1/

## mods
#SUPER_SPYGLASS=793605978
#STRUCTURES_PLUS=731604991
#DINO_STORAGE_V2=1609138312
#MONTES_ENGRAM_UNLOCKER=2020317130
#MODERN_WEAPONRY=1359737550

echo "updating server..."
steamcmd +force_install_dir "$SERVER_PATH" +login anonymous +app_update 376030 -beta preaquatica validate +quit

#echo "updating mods..."
#python3 /home/$USER/Ark/scripts/Ark_Mod_Downloader.py --modids "$SUPER_SPYGLASS" --workingdir "$SERVER_PATH" --steamcmd "/usr/games" --namefile
#python3 /home/$USER/Ark/scripts/Ark_Mod_Downloader.py --modids "$STRUCTURES_PLUS" --workingdir "$SERVER_PATH" --steamcmd "/usr/games" --namefile
#python3 /home/$USER/Ark/scripts/Ark_Mod_Downloader.py --modids "$DINO_STORAGE_V2" --workingdir "$SERVER_PATH" --steamcmd "/usr/games" --namefile
#python3 /home/$USER/Ark/scripts/Ark_Mod_Downloader.py --modids "$MONTES_ENGRAM_UNLOCKER" --workingdir "$SERVER_PATH" --steamcmd "/usr/games" --namefile
#python3 /home/$USER/Ark/scripts/Ark_Mod_Downloader.py --modids "$MODERN_WEAPONRY" --workingdir "$SERVER_PATH" --steamcmd "/usr/games" --namefile
