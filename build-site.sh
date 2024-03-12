#!/usr/bin/env bash
# This script first generates static html pages from tidders at ./output/static
# Then copy the files to ./westerlies, and replace all the url embedings in the filename

set -euo pipefail
IFS=$'\n\t'

tiddlywiki --rendertiddlers [!is[system]] $:/core/templates/static.tiddler.html static text/plain --rendertiddler $:/core/templates/static.template.css static/static.css text/plain

cp ./output/static/* ./westerlies/

index=1
cd ./westerlies
for file in *%*.html
do
    if [[ "$file" == "./westerlies/index.html" || "$file" == "./westerlies/archive.html" || "$file" == "./westerlies/index.html" || "$file" == "./westerlies/%2FUsers%2Fsicheng%2FWeber%2FRebello%2FMich%2FGithubPage%2Ftiddlers%2F%24__StoryList.tid.html" ]]; then
        continue
    fi
    index=$(($index+1))
    #echo $index "${file%%.html}"
    filename=${file%%.html}
    filename_url="${filename//\%/\%25}"
    newfile="post-$index"
    #echo $filename $newfile
    mv "$filename.html" "$newfile.html"
    sed -i "s/$filename_url/$newfile/g" *
done
cd ..
