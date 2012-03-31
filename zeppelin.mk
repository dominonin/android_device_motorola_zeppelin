#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# This is the product configuration for a generic GSM passion,
# not specialized for any geography.
#

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/motorola/zeppelin/init.rc:root/init.rc \
    device/motorola/zeppelin/init.zeppelin.rc:root/init.zeppelin.rc \
    device/motorola/zeppelin/factory.rle:root/factory.rle \
    device/motorola/zeppelin/initlogo.rle:root/initlogo.rle \
    device/motorola/zeppelin/logo.rle:root/logo.rle


## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/motorola/zeppelin/zeppelin-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
        ro.com.google.locationfeatures=1 \
        ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
        ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
        ro.config.vc_call_vol_steps=7 \
        ro.url.safetylegal=http://www.motorola.com/staticfiles/Support/legal/?model=MB501 \
        ro.setupwizard.enable_bypass=1 \
        dalvik.vm.lockprof.threshold=500 \
        dalvik.vm.dexopt-flags=m=y \
        debug.sf.hw=1 \
        ro.media.dec.aud.wma.enabled=1 \
        ro.media.dec.vid.wmv.enabled=1

DEVICE_PACKAGE_OVERLAYS += device/motorola/zeppelin/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml 


PRODUCT_PACKAGES += \
    copybit.zeppelin \
    libaudio \
    libcamera \
    libopencorehw \
    librpc \
    librs_jni \
    lights.zeppelin \
    sensors.zeppelin 


# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Passion uses high-density artwork where available
PRODUCT_LOCALES += mdpi

PRODUCT_COPY_FILES += \
    device/motorola/zeppelin/vold.fstab:system/etc/vold.fstab

PRODUCT_COPY_FILES += \
    device/motorola/zeppelin/btenable.sh:system/bin/btenable.sh \
    device/motorola/zeppelin/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/motorola/zeppelin/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/motorola/zeppelin/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

$(call inherit-product-if-exists, device/motorola/zeppelin/KernelModules.mk)

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
 

$(call inherit-product, build/target/product/full.mk)


PRODUCT_NAME := generic_zeppelin
PRODUCT_BRAND := AOSP
PRODUCT_DEVICE := zeppelin
PRODUCT_MODEL := MB501
PRODUCT_MANUFACTURER := Motorola
