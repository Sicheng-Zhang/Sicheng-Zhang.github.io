#!/usr/bin/env bash
# This script first generates static html pages from tidders at ./output/static
# Then copy the files to ./westerlies, and replace all the url embedings in the filename

set -euo pipefail
IFS=$'\n\t'

tiddlywiki --rendertiddlers [!is[system]] $:/core/templates/static.tiddler.html static text/plain --rendertiddler $:/core/templates/static.template.css static/static.css text/plain

rm ./westerlies/*.html
cp ./output/static/* ./westerlies/

index=1
cd ./westerlies
for file in *%*.html
do
    if [[ $file =~ "StoryList" ]]; then
        continue
    fi
    index=$(($index+1))
    filename_origin=${file%%.html}
    filename_url="${filename_origin//\%/\%25}"
    filename_replace1="${filename_url//\%/\_}"
    filename_replace2="${filename_replace1//\_2520/\_}"
    filename_replace3="${filename_replace2//\_253A/\_}"
    filename_replace4="${filename_replace3//\_2527/\_}"
    filename_replace5="${filename_replace4//\_25/}"
    newfile="${filename_replace5//\_\_/\_}"
    mv "$filename_origin.html" "$newfile.html"
    sed -i "s/\"$filename_url.html\"/\"$newfile.html\"/g" *.html
done
cd ..
