#!/bin/bash

# build firmware
sh /lede/scripts/build.sh

# move firmware
mv /lede/src/bin/targets/* /lede/firmware/
