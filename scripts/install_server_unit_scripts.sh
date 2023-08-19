#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "ERROR: This must be run as root"
    exit 1
fi

cp -v *.service /etc/systemd/system/
cp -v *.timer /etc/systemd/system/
systemctl daemon-reload
