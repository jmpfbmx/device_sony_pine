#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_CHARACTERISTICS := phone

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

DEVICE_PATH:= device/sony/pine

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal large xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

#mtk
PRODUCT_PACKAGES += \
    EngineerMode \
    YGPS

# Configure dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# Vendor product configurations
$(call inherit-product, vendor/sony/pine/pine-vendor.mk)

## Specify phone tech before including full_phone
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit framework first
#$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.r_submix.default \
    audio_policy.default \
    libaudiopolicymanagerdefault \
    audio.usb.default \
    libaudio-resampler \
    libtinyalsa \
    libtinycompress \
    libtinymix \
    libtinyxml 

# Configurations
PRODUCT_COPY_FILES += \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:system/etc/etc/a2dp_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:system/etc/etc/audio_policy_volumes.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/default_volume_tables.xml:system/etc/etc/default_volume_tables.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:system/etc/etc/r_submix_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/etc/usb_audio_policy_configuration.xml \
    $(DEVICE_PATH)/configs/AudioParamOptions.xml:system/etc/audio_param/AudioParamOptions.xml \
    $(DEVICE_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(DEVICE_PATH)/configs/audio_device.xml:system/etc/audio_device.xml

# Bluetooth
PRODUCT_PACKAGES += \
	bluetooth.default
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/bluetooth/bt_did.conf:system/etc/bluetooth/bt_did.conf 

# Camera
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.manual_sensor.xml:system/etc/permissions/android.hardware.camera.manual_sensor.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml 

# Camera
PRODUCT_PACKAGES += \
    Snap \
    libcam_platform

# Display
PRODUCT_PACKAGES += \
    libion

#PRODUCT_PACKAGES += \
    EngineerMode

# FMRadio
MTK_FM_SUPPORT := true

# FM
PRODUCT_PACKAGES += \
    libfmjni \
    FMRadio 

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    fibmap.f2fs \
    fsck.f2fs \
    mkfs.f2fs \
    make_ext4fs \
    resize2fs \
    setup_fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    fsck.ntfs \
    mkfs.ntfs \
    mount.ntfs

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# GPS library
PRODUCT_PACKAGES += \
    gps.mt6737t \
    libcurl

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    $(DEVICE_PATH)/configs/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.software.device_admin.xml:system/etc/permissions/android.software.device_admin.xml \
    frameworks/native/data/etc/android.software.managed_users.xml:system/etc/permissions/android.software.managed_users.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Shim symbols
PRODUCT_PACKAGES += \
    libmtk_symbols \
    libxlog \
    libperfservicenative \
    libcurl \
    libshim_sony_camera

#vendor_libs
PRODUCT_PACKAGES += \
    lights.mt6737t \
    local_time.default \
    audio.primary.default \
    vibrator.default \
    gralloc.default \
    Torch 

# MTK Logging functions
PRODUCT_PACKAGES += \
    liblog_mtk

# Keyhandler package
PRODUCT_PACKAGES += \
    com.cyanogenmod.keyhandler

PRODUCT_SYSTEM_SERVER_JARS += com.cyanogenmod.keyhandler

# Never dexopt the keyhandler
$(call add-product-dex-preopt-module-config,com.cyanogenmod.keyhandler,disable)

# CODECS
PRODUCT_COPY_FILES += \
  $(DEVICE_PATH)/configs/media_codecs_mediatek_audio.xml:system/etc/media_codecs_mediatek_audio.xml \
  $(DEVICE_PATH)/configs/media_codecs_mediatek_video.xml:system/etc/media_codecs_mediatek_video.xml \
  $(DEVICE_PATH)/configs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
  $(DEVICE_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
  $(DEVICE_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
  $(DEVICE_PATH)/configs/mtk_omx_core.cfg:system/etc/mtk_omx_core.cfg \
  frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
  frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
  frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \
  frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml 

#su
PRODUCT_PACKAGES += \
	su 

# Misc
PRODUCT_PACKAGES += \
    libnl_2
 
# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

# Packages
#PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    Tag

# Configurations
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/nfc/nfcse.cfg:system/etc/nfcse.cfg \
    $(DEVICE_PATH)/configs/nfc/nfc.cfg:system/etc/nfc.cfg 

# Charger Mode
PRODUCT_PACKAGES += \
    charger_res_images \
    charger

    # Power
PRODUCT_PACKAGES += \
   power.mt6737t \
   power.default 

# Default.prop
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    camera.disable_zsl_mode=1 \
    ro.oem_unlock_supported=1 \
    persist.service.acm.enable=0 \
    persist.sys.dun.override=0 \
    sys.usb.ffs.aio_compat=1 \
    ro.mount.fs=EXT4 \
    ro.mtk_key_manager_kb_path=1 
    
ifneq ($(TARGET_BUILD_VARIANT), user)
# ADB Debugging
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.debuggable=1 \
    ro.secure=0
endif

#If you need complie twrp,please # Ramdisk and enable this
#PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/factory_init.project.rc:root/factory_init.project.rc \
    $(DEVICE_PATH)/rootdir/factory_init.rc:root/factory_init.rc \
    $(DEVICE_PATH)/rootdir/fstab.mt6735:root/fstab.mt6735 \
    $(DEVICE_PATH)/rootdir/fstab.fota:root/fstab.fota \
    $(DEVICE_PATH)/rootdir/meta_init.modem.rc:root/meta_init.modem.rc \
    $(DEVICE_PATH)/rootdir/meta_init.project.rc:root/meta_init.project.rc \
    $(DEVICE_PATH)/rootdir/meta_init.rc:root/meta_init.rc \
    $(DEVICE_PATH)/rootdir/ueventd.mt6735.rc:root/ueventd.mt6735.rc \
    $(DEVICE_PATH)/rootdir/init.mt6735.usb.rc:root/init.mt6735.usb.rc \
    $(DEVICE_PATH)/recovery/twrp.fstab:recovery/root/etc/twrp.fstab
#    $(DEVICE_PATH)/rootdir/init.recovery.mt6735.rc:root/init.recovery.mt6735.rc

#Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)/rootdir,root)

#RC
TARGET_PROVIDES_INIT_RC := true

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/etc/init/audioserver.rc:system/etc/init/audioserver.rc \
    $(DEVICE_PATH)/etc/init/mediacodec.rc:system/etc/init/mediacodec.rc \
    $(DEVICE_PATH)/etc/init/cameraserver.rc:system/etc/init/cameraserver.rc \
    $(DEVICE_PATH)/etc/init/rild.rc:system/etc/init/rild.rc 

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/sony/pine/prebuilts/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# RIL
PRODUCT_PACKAGES += \
    gsm0710muxd \
    libprotobuf-cpp-full

PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    ro.telephony.ril_class=MT6735 \
    ro.telephony.ril.config=fakeiccid \
    ro.com.android.mobiledata=false \
    ro.kernel.android.checkjni=0

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/spn-conf.xml:system/etc/spn-conf.xml \
    $(DEVICE_PATH)/configs/ecc_list.xml:system/etc/ecc_list.xml

# Sensors
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml 
    
# Sensor Calibration
PRODUCT_PACKAGES += \
    libem_sensor_jni

# Tethering
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

# USB
PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

# WiFi
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml 

#wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    lib_driver_cmd_mt66xx \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/hostapd/hostapd_default.conf:system/etc/wifi/hostapd_default.conf \
    $(DEVICE_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf