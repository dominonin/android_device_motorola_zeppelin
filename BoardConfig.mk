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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/motorola/zeppelin/BoardConfigVendor.mk

# Hardware
TARGET_BOARD_PLATFORM := msm7k
TARGET_CPU_ABI := armeabi
BOARD_VENDOR_USE_AKMD := akm8973
BOARD_USES_QCOM_LIBS := true
TARGET_BOOTLOADER_BOARD_NAME := zeppelin
TARGET_NO_BOOTLOADER := true
TARGET_OTA_ASSERT_DEVICE := zepp,zeppelin

# Kernel
TARGET_PREBUILT_KERNEL := device/motorola/zeppelin/kernel
BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null quiet
BOARD_KERNEL_BASE := 0x10000000
TARGET_PROVIDES_INIT_RC := true

# WiFi
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_5_X
BOARD_WLAN_DEVICE           := bcm4329
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/wifi/sdio-g-cdc-reclaim-wme.bin nvram_path=/system/etc/wifi/nvram.txt"
WIFI_DRIVER_MODULE_NAME     := "dhd"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Graphics
BOARD_EGL_CFG := device/motorola/zeppelin/egl.cfg
BUILD_WITH_FULL_STAGEFRIGHT:= true


# GPS
BOARD_GPS_LIBRARIES := libloc_api
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm7k
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 3200
BOARD_VENDOR_QCOM_AMSS_VERSION := 3200


# Audio
BOARD_USES_GENERIC_AUDIO := false
TARGET_PROVIDES_LIBAUDIO := true

# Recovery
TARGET_RECOVERY_PRE_COMMAND := "/system/bin/setrecovery recovery"
BOARD_CUSTOM_RECOVERY_KEYMAPPING:= ../../device/motorola/zeppelin/recovery/recovery_ui.c
TARGET_PREBUILT_RECOVERY_KERNEL := device/motorola/zeppelin/recovery_kernel
