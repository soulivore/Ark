#!/bin/bash

for dir in /home/$USER/Ark/servers/*/
do 
	dir=${dir%*/} # removes trailing slashes
	dirname="${dir##*/}" # just the bottom-level directory name without the path
    targetdir=/home/$USER/Ark/backup/$dirname/config
	
    # copy Game.ini and GameUserSettings.ini
    for filename in Game.ini GameUserSettings.ini; do
        mkdir -p $targetdir && cp $dir/ShooterGame/Saved/Config/LinuxServer/$filename $targetdir/
    done

    # copy server_start.sh
    #mkdir -p $targetdir && cp $dir/ShooterGame/Binaries/Linux/server_start.sh $targetdir/

done

