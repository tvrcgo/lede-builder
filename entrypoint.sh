#!/bin/bash

# clone lede source
git clone --depth 1 https://github.com/coolsnowwolf/lede.git -b master src
cd src

# update feeds
./scripts/feeds update -a
./scripts/feeds install -a

# load custom config
[ -e $CONFIG_FILE ] && mv $CONFIG_FILE ./.config

# generate config file
make defconfig

# make download
make -j8 download

# compile
make -j$(($(nproc) + 1)) V=s
