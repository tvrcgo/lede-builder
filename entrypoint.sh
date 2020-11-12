#!/bin/bash

# prepare
CONFIG_FILE=/openwrt/config/$DEVICE_NAME.config

# build firmware
sh /openwrt/scripts/build.sh

# move firmware
FIRMWARE_DIR=/openwrt/firmware/$DEVICE_NAME-$(date +"%Y%m%d%H%M")
mkdir -p $FIRMWARE_DIR
mv /openwrt/src/bin/targets/* $FIRMWARE_DIR
