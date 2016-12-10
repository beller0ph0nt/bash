#! /bin/bash

# These are called magic commands, and they’re pretty much synonymous with
# holding down Alt-SysRq and another key on older keyboards.
# http://en.wikipedia.org/wiki/Magic_SysRq_key

# Dropping 1 into /proc/sys/kernel/sysrq tells the kernel that you want to
# enable SysRq access (it’s usually disabled).
echo 1 > /proc/sys/kernel/sysrq

# The second command is equivalent to pressing Alt-SysRq-b on a QWERTY keyboard.
echo b > /proc/sysrq-trigger