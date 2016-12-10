#!/bin/bash

wget \
    --recursive \
    --no-clobber \
    --page-requisites \
    --html-extension \
    --convert-links \
    --restrict-file-names=windows \
    --domains dmilvdv.narod.ru \
    --no-parent \
    -e robots=off \
    http://dmilvdv.narod.ru/Translate/ELSDD/