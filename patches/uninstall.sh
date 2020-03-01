#!/bin/sh
cd ../../../..
cd frameworks/av
git checkout -- . && git clean -df
cd ../base
git checkout -- . && git clean -df
cd ../native
git checkout -- . && git clean -df
cd ../../bionic
git checkout -- . && git clean -df
cd ../system/netd
git checkout -- . && git clean -df
cd ../core
git checkout -- . && git clean -df
cd ../..
