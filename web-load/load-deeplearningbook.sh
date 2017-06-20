#!/bin/bash

SITE="http://www.deeplearningbook.org"
TMP_DIR="__tmp__"

function get_regexp_str()
{
    local SIMBOLS="/."
    local STR=$1

    for ((i=0; i<${#SIMBOLS}; i++)); do
        local SIMBOL=${SIMBOLS:$i:1}
        STR=${STR//$SIMBOL/'\'$SIMBOL}
    done

    echo $STR
}

function get_content_urls()
{
    local ADDRESS=$1

    wget -q -O - $ADDRESS | \
        grep 'contents/.*\.html' | \
        sed 's/^.*="/'$(get_regexp_str $ADDRESS)'\//' | \
        sed 's/">.*$//'
}

CONTENTS=$(get_content_urls $SITE)

rm -rf $TMP_DIR
mkdir $TMP_DIR

# download phantomjs to TMP_DIR
#...

# extract phantomjs
#...


# download book
#for url in $CONTENTS
#do
#    echo -n "convert "$url" to pdf "
#    phantomjs examples/rasterize.js http://www.deeplearningbook.org/contents/intro.html 2.pdf "11.7in*16.5in"
#    echo "[ OK ]"
#done

rm -f $TMP_DIR