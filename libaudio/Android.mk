ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),zeppelin)

ifneq ($(BUILD_TINY_ANDROID),true)

$(warning Enabling QCOM audio HW )

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:=               \
    AudioPolicyManager.cpp

LOCAL_SHARED_LIBRARIES := \
    libcutils \
    libutils \
    libmedia

LOCAL_STATIC_LIBRARIES := libaudiopolicybase
LOCAL_MODULE:= libaudiopolicy
LOCAL_CFLAGS += -DWITH_A2DP
include $(BUILD_SHARED_LIBRARY)


include $(CLEAR_VARS)

LOCAL_MODULE := libaudio

LOCAL_SHARED_LIBRARIES := \
    libcutils \
    libutils \
    libmedia \
    libhardware_legacy

ifeq ($(TARGET_OS)-$(TARGET_SIMULATOR),linux-true)
    LOCAL_LDLIBS += -ldl
endif

ifneq ($(TARGET_SIMULATOR),true)
LOCAL_SHARED_LIBRARIES += libdl
endif

LOCAL_CFLAGS += -DSURF
  
LOCAL_SRC_FILES += AudioHardware.cpp

LOCAL_CFLAGS += -fno-short-enums

LOCAL_CFLAGS += -DMSM72XX_AUDIO
LOCAL_CFLAGS += -DVOC_CODEC_DEFAULT=0
LOCAL_CFLAGS += -DMOT_FEATURE_PLATFORM_MSM7K=1
LOCAL_CFLAGS += -DHAVE_FM_RADIO=1 -DLIBAUDIO_ECLAIR=1

LOCAL_STATIC_LIBRARIES += libaudiointerface
LOCAL_SHARED_LIBRARIES += liba2dp

include $(BUILD_SHARED_LIBRARY)

endif # not BUILD_TINY_ANDROID
endif
