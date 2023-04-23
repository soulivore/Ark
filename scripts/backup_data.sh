#!/bin/bash

# The server creates its own rolling backups
# It saves them in ShooterGame/Saved/SavedArks
# The server backs up to <name>.ark every 10 min
#   (because 10 minutes is how often I told it to backup)
# Then every 2 hrs and 10 min it creates a separate rolling backup file
#   called <name>_dd.mm.yyyy_hh.mm.ss.ark

# Because the server can take a while to write a save file,
#   it would be better to copy files after enough time has passed
#   for the write to finish.

# To test whether or not a file is older than n minutes, run
#   find "filename_in_quotes.extension" -mmin +n
# Ex. if n=5, it will return the filename if the file is 6 or more min old
# You can use 
#   mmin for "time since file was modified"   
#   cmin for "time since status changed"   
#   I don't know what the meaningful difference is, so I'll go with mmin

# Example code for testing if a file is older than 3 minutes
#if test `find /home/$USER/Ark/servers/server_Ragnarok_1/ShooterGame/Saved/SavedArks/Ragnarok.ark -mmin +3`; then
#    echo "so old"
#fi

# re-run every minute
while true; do

    # loop over ark server directories
    for dir in /home/$USER/Ark/servers/*/; do
    
        dir=${dir%*/} # removes trailing slashes
        dirname="${dir##*/}" # just the bottom-level directory name without the path
    
        # get the map name out from between "server_" and "_<number>"
        # This works, but it's shit code. Leaving it here as a tutorial
        #echo $dirname
        #blarg="${dirname##*server_}"
        #echo $blarg
        #honk="${blarg%*_*}"
        #echo $honk
    
        # get the map name out from between "server_" and "_<number>"
        mapname=$(echo "$dirname" | awk -F '_' '{print $2}' )
    
        # test if a file is older than 3 minutes
        if test `find $dir/ShooterGame/Saved/SavedArks/$mapname.ark -mmin +3`; then
            
            # if so, back it up
            targetdir=/home/$USER/Ark/backup/$dirname/data
            mkdir -p $targetdir && rsync -r --delete $dir/ShooterGame/Saved/SavedArks/ $targetdir/
        fi
    
    done

    # backup the cluster directory
    mkdir -p /home/$USER/Ark/backup/cluster && rsync -r --delete /home/$USER/Ark/cluster/ /home/$USER/Ark/backup/cluster

    sleep 60
done
