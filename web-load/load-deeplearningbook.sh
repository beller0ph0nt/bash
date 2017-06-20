#!/bin/bash

SITE="http://www.deeplearningbook.org"
PHANTOMJS_DIR="phantomjs-2.1.1-linux-i686"
PHANTOMJS_TAR=$PHANTOMJS_DIR".tar.bz2"
PHANTOMJS_URL="https://bitbucket.org/ariya/phantomjs/downloads/"$PHANTOMJS_TAR
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
wget -O $TMP_DIR/$PHANTOMJS_TAR $PHANTOMJS_URL
tar -xjf $TMP_DIR/$PHANTOMJS_TAR -C $TMP_DIR

for url in $CONTENTS
do
    pdf_name=$(echo $url | sed 's/^.*contents\///' | sed 's/html/pdf/')
    echo -n "convert $url to pdf $pdf_name "
    $TMP_DIR/$PHANTOMJS_DIR/bin/phantomjs $TMP_DIR/$PHANTOMJS_DIR/examples/rasterize.js $url $TMP_DIR/$pdf_name "11.7in*16.5in"
    echo "[ OK ]"
done

#rm -rf $TMP_DIR