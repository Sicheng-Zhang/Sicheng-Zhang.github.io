#!/usr/bin/env bash
for file in ./*
do
	convert -resize x960 "$file" "$file"
	echo "$file"
done
