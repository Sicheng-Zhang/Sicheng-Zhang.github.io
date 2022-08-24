#!/usr/bin/env bash
tiddlywiki --rendertiddlers [!is[system]] $:/core/templates/static.tiddler.html static text/plain --rendertiddler $:/core/templates/static.template.css static/static.css text/plain --rendertiddler $:/core/templates/alltiddlers.template.html static/archive.html text/plain
