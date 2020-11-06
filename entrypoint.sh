#!/bin/bash

# clone lede source
git clone --depth 1 $REPO_URL -b $REPO_BRANCH src
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
