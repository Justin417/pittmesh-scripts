#!/bin/bash
echo -e "Please enter the full (escaped) file path:"
read -r path
echo "Path: $path"
echo -e "Enter the destination:"
read -r dst
echo "Destination: $dst"
while [ 1 ]
do
    rsync --progress --partial --append --verbose -e ssh $path "root@100.*.*.*:$dst"
    if [ "$?" = "0" ] ; then
        echo "rsync completed normally"
        exit
    else
        echo "rsync failure. Retrying in a minute..."
        sleep 60
    fi
done
