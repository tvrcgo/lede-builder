#!/bin/bash

# build firmware
sh /lede/scripts/build.sh

# move firmware
FIRMWARE_DIR=/lede/firmware/$(date +"%Y%m%d%H%M")
mkdir -p $FIRMWARE_DIR
mv /lede/src/bin/targets/* $FIRMWARE_DIR
