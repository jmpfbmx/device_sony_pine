#!/bin/bash
cd ../../../..
cd frameworks/av
git apply -v ../../device/sony/pine/patches/frameworks/av.patch
cd ../..
cd frameworks/base
git apply -v ../../device/sony/pine/patches/frameworks/base.patch
git apply -v ../../device/sony/pine/patches/frameworks/base2.patch
#cd ../..
cd frameworks/native
git apply -v ../../device/sony/pine/patches/frameworks/native.patch
cd ../..
cd bionic
git apply -v ../device/sony/pine/patches/bionic/0001-bionic_if.patch
git apply -v ../device/sony/pine/patches/bionic/bionic_libc.patch
cd ..
cd system/netd
git apply -v ../../device/sony/pine/patches/system/0004-system_netd.patch
cd ../..
cd system/core
git apply -v ../../device/sony/pine/patches/system/0001-for-pine.patch
#patch -p1 <  ../../device/sony/pine/patches/core.patch
cd ../..
