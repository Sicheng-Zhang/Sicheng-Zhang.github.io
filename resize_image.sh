#!/usr/bin/env bash
for file in ./*
do
	convert -resize x1200 "$file" "$file"
	echo "$file"
done
