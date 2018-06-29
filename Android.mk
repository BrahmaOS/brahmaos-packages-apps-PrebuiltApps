#
# Android.mk
# Winton.Liu, 2018-06-26 09:06
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_POST_PROCESS_COMMAND := $(shell mkdir -p $(TARGET_OUT)/app)
LOCAL_POST_PROCESS_COMMAND := $(shell mkdir -p $(TARGET_OUT_DATA)/app)
LOCAL_POST_PROCESS_COMMAND := $(shell mkdir -p $(TARGET_OUT)/preloadapp)
LOCAL_POST_PROCESS_COMMAND := $(shell mkdir -p $(TARGET_OUT)/lib)

LOCAL_POST_PROCESS_COMMAND := $(shell cp -r $(LOCAL_PATH)/systemapp/*.apk $(TARGET_OUT)/app/)
LOCAL_POST_PROCESS_COMMAND := $(shell cp -r $(LOCAL_PATH)/dataapp/*.apk $(TARGET_OUT_DATA)/app)
LOCAL_POST_PROCESS_COMMAND := $(shell cp -r $(LOCAL_PATH)/preloadapp/*.apk $(TARGET_OUT)/preloadapp)
LOCAL_POST_PROCESS_COMMAND := $(shell cp -r $(LOCAL_PATH)/lib/*.so $(TARGET_OUT)/lib)

include $(CLEAR_VARS)
LOCAL_MODULE := preloadapp
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
LOCAL_INIT_RC := preloadapp.rc
LOCAL_SRC_FILES := preloadapp.sh
include $(BUILD_PREBUILT)
