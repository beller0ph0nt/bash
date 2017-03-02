#! /bin/bash

# 446 bit key
echo "key_phrase" | sha512sum | cut -d ' ' -f 1 | head -c 112 | wc