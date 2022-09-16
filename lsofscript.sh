#!/bin/bash

for proc in `ls  /proc/ | egrep "^[0-9]" | sort -n`
    do
    procdir="/proc/$proc"
    if [[ -d "$procdir" ]]
        then

        command=`cat /proc/$proc/comm`

        mapfiles=`readlink /proc/$proc/map_files/*; readlink /proc/$proc/cwd`
        if ! [[ -z "$mapfiles" ]]
            then
            for num in $mapfiles
            do
            printf "%-20s\n" $proc $num $command
            done
        fi
   fi
done
