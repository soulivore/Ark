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

## check if the argument begins with /home/$USER
#
## this is how you set a variable
#prefix="/home/$USER"
#
## if you wanted to print out the variable, you would do
##echo "$prefix"
##echo "${prefix}"
#
## the stuff inside the parenthesis gives the length of the string $prefix
#n=$(echo "$prefix" | tr -d '\n' | wc -c)
#
## get a string consisting of the first n characters of the first argument
#arg_prefix="${1:0:$n}" 
#
#if [ $arg_prefix != $prefix ]; then
#    echo "ERROR: unrecognized filepath. Script must be passed one argument, which is the filepath to the server's install directory"
#fi

echo "updating server at $1..."
steamcmd +force_install_dir $1 +login anonymous +app_update 376030 +quit

