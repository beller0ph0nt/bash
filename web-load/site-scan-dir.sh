#!/bin/bash

wget --spider -r http://www.deeplearningbook.org 2>&1 | grep '^--' | grep 'contents' | awk '{ print $3 }' | uniq