#!/usr/bin/env bash

source /config/config.shlib;

$Ext
$AGE_OF_FILE
$PATH

tar cvf $PATH/*.$Ext.tgz $PATH/*.$Ext
