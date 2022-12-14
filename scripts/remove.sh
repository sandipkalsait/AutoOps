#!/usr/bin/env bash

source /config/config.shlib;

$Ext
$AGE_OF_FILE
$PATH

find $PATH -type f -mtime +$AGE_OF_FILE -name "*.$Ext" -exec rm -rf {} \;
