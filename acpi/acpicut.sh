#!/bin/bash

#DMESG_ACPI_INFO=$(dmesg |
#                  grep 'ACPI: [A-Z]\{4\} 0x')
#echo $DMESG_ACPI_INFO
#

#MEM_DUMP_FILE='/dev/mem'
MEM_DUMP_FILE='mem.dump'

ACPI_LIST=$(dmesg |
            grep 'ACPI: [A-Z]\{4\} 0x' |
            sed 's/^.*ACPI:\s*//' |
            sed 's/\s*(.*$//' |
            sed 's/0x//' |
            awk '{ print "TABLE=\""$1"\";OFFSET=$((16#"$2"));LEN=$((16#"$3")); " }')

for vars in $ACPI_LIST
do
    eval $vars
    echo "$TABLE $OFFSET $LEN"
    dd if=$MEM_DUMP_FILE of=$TABLE.dat bs=1 skip=$OFFSET count=$LEN
done
