#!/bin/bash

OPENWRT="openwrt"

echo '+++'
echo '+++ building the ffrn firmware'
echo '+++'

echo '+++ remove old images'
rm -rf ${OPENWRT}/bin/ar71xx/*

echo '+++ copy config'
cp openwrt-config ${OPENWRT}/.config

echo '+++ link files folder'
ln -s ../files ${OPENWRT}/files

echo '+++ link feeds.conf'
ln -s ../feeds.conf ${OPENWRT}/feeds.conf

echo '+++ update feeds'
${OPENWRT}/scripts/feeds update -a

echo '+++ install feeds'
${OPENWRT}/scripts/feeds install -a

echo '+++ start build process'
cd openwrt
make -j 6
cd ../

echo '+++ remove links and config'
rm  ${OPENWRT}/.config
rm  ${OPENWRT}/files
rm  ${OPENWRT}/feeds.conf



