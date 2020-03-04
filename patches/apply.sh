#!/bin/sh
cd ../../../..
echo "Apply bionic Patches"
mkdir -p bionic/1-patches
cp -r device/sony/pine/patches/bionic/0001-bionic_if.patch bionic/1-patches/
cp -r device/sony/pine/patches/bionic/bionic_libc.patch
cd bionic
git apply -v 1-patches/0001-bionic_if.patch
git apply -v 1-patches/bionic_libc.patch
cd ..
sleep2
echo "Apply frameworks/av Patches"
mkdir -p frameworks/av/1-patches
cp -r device/sony/pine/patches/frameworks/av.patch frameworks/av/1-patches
cd frameworks/base
git apply -v 1-patches/av.patch
cd ../..
sleep 2
echo "Apply frameworks/base Patches"
mkdir -p frameworks/base/1-patches
cp -r device/sony/pine/patches/frameworks/base.patch frameworks/base/1-patches
cp -r device/sony/pine/patches/frameworks/base2.patch frameworks/base/1-patches
cd frameworks/base
git apply -v 1-patches/base.patch
git apply -v 1-patches/base2.patch
cd ../..
sleep 2
echo "Apply frameworks/native Patches"
mkdir -p frameworks/native/1-patches
cp -r device/sony/pine/patches/frameworks/native.patch frameworks/native/1-patches
cd frameworks/native
git apply -v 1-patches/native.patch
cd ../..
sleep 2
echo "Apply frameworks/opt/telephony Patches"
mkdir -p frameworks/opt/telephony/1-patches
cp -r device/sony/pine/patches/frameworks/telephony.patch frameworks/opt/telephony/1-patches
cd frameworks/opt/telephony
git apply -v 1-patches/telephony.patch
cd ../../..
sleep 2
echo "Apply system/core Patches"
mkdir -p system/core/1-patches
cp -r device/sony/pine/patches/0001-for-pine.patch system/core/1-patches
cd system/core
git apply -v 1-patches/0001-for-pine.patch
cd ../..
sleep 2
echo "Apply system/netd Patches"
mkdir -p system/netd/1-patches
cp -r device/sony/pine/patches/0004-system_netd.patch system/netd/1-patches
cd system/netd
git apply -v 1-patches/0004-system_netd.patch
cd ../..
sleep 2
echo "Apply packages/apps/FMRadio Patches"
mkdir -p packages/apps/FMRadio/1-patches
cp -r device/sony/pine/patches/packages/apps/FMRadio/FMRadio.patch packages/apps/FMRadio/1-patches
cd packages/apps/FMRadio
git apply -v 1-patches/FMRadio.patch
sleep 2
echo "Patches applied succesfully"
