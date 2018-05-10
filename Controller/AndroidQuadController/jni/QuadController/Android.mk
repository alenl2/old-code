LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := QuadController

LOCAL_SRC_FILES := QuadController.cpp

LOCAL_LDLIBS    := -llog

LOCAL_STATIC_LIBRARIES += enet_static

include $(BUILD_SHARED_LIBRARY)
include $(call all-subdir-makefiles)
