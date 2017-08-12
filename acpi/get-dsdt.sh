#!/bin/bash

#Get original DSDT:
cp /proc/acpi/dsdt DSDT
#or
acpidump > acpidump.out
acpixtract DSDT acpidump > DSDT.dat

#Disassemble it
iasl -d DSDT.dat

#Make your changes:
#$ vi DSDT.dsl

#Build it:
iasl -tc DSDT.dsl

#Put it where the kernel build can include it:
#cp DSDT.hex $SRC/include/

#Add this to the kernel .config:
#CONFIG_STANDALONE=n
#CONFIG_ACPI_CUSTOM_DSDT=y
#CONFIG_ACPI_CUSTOM_DSDT_FILE="DSDT.hex"

#Make the kernel and off you go!