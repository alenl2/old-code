LOCAL_PATH:= $(call my-dir)

# ------------------------------------------------------------------
# Static library for Cocos
# ------------------------------------------------------------------

include $(CLEAR_VARS)

LOCAL_MODULE := enet_static

LOCAL_CFLAGS := -DHAS_SOCKLEN_T

LOCAL_MODULE_FILENAME := libenet

LOCAL_SRC_FILES := callbacks.c \
					compress.c \
					host.c \
					list.c \
					packet.c \
					peer.c \
					protocol.c \
					unix.c

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)

include $(BUILD_STATIC_LIBRARY)
