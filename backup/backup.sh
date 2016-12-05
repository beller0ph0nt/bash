#!/bin/bash

OUT_DIR='./'

if [ -n $1 ]
then
    OUT_DIR=$1'/'
fi

#sudo tar -czf $OUT_DIR'backup-'$(date +"%Y%m%d%H%M%S").tar.bz2 /etc /home
sudo tar -cf $OUT_DIR'backup-'$(date +"%Y%m%d%H%M%S").tar /etc /home