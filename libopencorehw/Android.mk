LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

# Set up the OpenCore variables.
include external/opencore/Config.mk

LOCAL_C_INCLUDES := $(PV_INCLUDES)

LOCAL_SRC_FILES := android_surface_output_fb.cpp
 
LOCAL_CFLAGS += $(PV_CFLAGS) -fvisibility=default

LOCAL_SHARED_LIBRARIES := \
    libbinder \
    libutils \
    libcutils \
    libui \
    libhardware\
    libandroid_runtime \
    libmedia \
    libskia \
    libopencore_common \
    libicuuc \
    libopencore_player \
    libsurfaceflinger_client

LOCAL_LDLIBS +=

LOCAL_MODULE := libopencorehw
include $(BUILD_SHARED_LIBRARY)

