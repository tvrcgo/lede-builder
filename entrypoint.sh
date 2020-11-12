#!/bin/bash

# build firmware
sh /openwrt/scripts/build.sh

# move firmware
FIRMWARE_DIR=/openwrt/firmware/$(date +"%Y%m%d%H%M")
mkdir -p $FIRMWARE_DIR
mv /openwrt/src/bin/targets/* $FIRMWARE_DIR
