#! /bin/bash

# disk creation
#dd if=/dev/random of=disk bs=1M count=10

DISK="./disk"
LOOP="/dev/loop0"
SIZE='sudo blockdev --getsz $(LOOP)'

sudo insmod ./blowfish_generic.ko 
sudo insmod ./blowfish_common.ko

sudo losetup $(LOOP) disk
sudo dmsetup create x --table "0 $(SIZE) crypt blowfish-ecb ffffffffffffffffffffffffffffffff 0 $(LOOP) 0"