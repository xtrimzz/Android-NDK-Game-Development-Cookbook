#
LOCAL_PATH := $(call my-dir)

# bringing in libraries
include $(CLEAR_VARS)

LOCAL_ARM_MODE := arm
LOCAL_MODULE := App13

# using Engine include folders
LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/../include \
	$(LOCAL_PATH)/../include/vorbis \
	$(LOCAL_PATH)/../include/modplug \
	$(LOCAL_PATH)/../src \
	$(LOCAL_PATH)/../src/core \
	$(LOCAL_PATH)/../src/fs \
	$(LOCAL_PATH)/../src/threading \
	$(LOCAL_PATH)/../src/carousel

LOCAL_SRC_FILES += Wrappers.cpp WrappersJNI.c \
	../main.cpp \
	../src/threading/Thread.cpp \
	../src/threading/tinythread.cpp \
	../src/VecMath.cpp \
	../src/fs/FileSystem.cpp \
	../src/fs/libcompress.c \
	../src/fs/Archive.cpp \
	../src/Rendering.cpp \
	../src/Gestures.cpp \
	../src/Multitouch.cpp \
	../src/Engine.cpp \
	../src/carousel/FlowFlinger.cpp

LOCAL_ARM_MODE := arm
PROJ_CFLAGS := -Wno-unused-value -Wno-format-extra-args -Wno-format-security -O3 -Werror -DANDROID -DDISABLE_IMPORTGL -D_DISABLE_TUNNELLERS_ -D_DISABLE_METHODS_ -DDISABLE_GUARD_UNGUARD_MECHANISM

ifeq ($(TARGET_ARCH),x86)
	GLOBAL_CFLAGS  := $(PROJ_CFLAGS)
else
	GLOBAL_CFLAGS  := -mfpu=vfp -mfloat-abi=softfp -fno-short-enums $(PROJ_CFLAGS)
endif

LOCAL_CFLAGS := $(GLOBAL_CFLAGS)

LOCAL_CPPFLAGS += -std=gnu++11

LOCAL_LDLIBS    += -llog -lGLESv2

include $(BUILD_SHARED_LIBRARY)
