#!/bin/bash

banner='U.C.P-Hunter'

developer='Developer: https://github.com/kartik00013\n'

figlet $banner
echo -e $developer

file=$1

if [ "$#" = 0 ]; then
        echo -e 'Usage: bash ucp-hunter.sh filename or ./ucp-hunter.sh filename\n'
        exit
else
        if [ -r "$file" ]; then
                echo -e 'Working on it......\n'
                while read target; do 
                        if [[ $(curl -s -X PURGE "https://$target" | grep '“status”: “ok”' > /dev/null) ]]; then
                                echo $target
                        fi
                done < $file
        else
                echo 'Error: Either the file does not exist at the specified path or the file does not have read permission'
                exit
        fi
fi
