#
# Copyright (C) 2016 The Yudatun Open Source Project
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation
#

LOCAL_PATH := $(call my-dir)

common_core_srcs := \
    src/lapi.c \
    src/lcode.c \
    src/lctype.c \
    src/ldebug.c \
    src/ldo.c \
    src/ldump.c \
    src/lfunc.c \
    src/lgc.c \
    src/llex.c \
    src/lmem.c \
    src/lobject.c \
    src/lopcodes.c \
    src/lparser.c \
    src/lstate.c \
    src/lstring.c \
    src/ltable.c \
    src/ltm.c \
    src/lundump.c \
    src/lvm.c \
    src/lzio.c

common_lib_srcs := \
    src/lauxlib.c \
    src/lbaselib.c \
    src/lbitlib.c \
    src/lcorolib.c \
    src/ldblib.c \
    src/liolib.c \
    src/lmathlib.c \
    src/loslib.c \
    src/lstrlib.c \
    src/ltablib.c \
    src/lutf8lib.c \
    src/loadlib.c \
    src/linit.c

common_headers := $(LOCAL_PATH)/src
common_cflags := -std=gnu99 -O2 -Wall -Wextra -DLUA_COMPAT_5_2 $(SYSCFLAGS)

#---------------------------------------
# Target executeable: lua
include $(CLEAR_VARS)

LOCAL_SRC_FILES := src/lua.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_MODULE := lua
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := $(common_headers)
LOCAL_SHARED_LIBRARIES := liblua

include $(BUILD_EXECUTABLE)

#---------------------------------------
# Target executeable: luac
include $(CLEAR_VARS)

LOCAL_SRC_FILES := src/luac.c
LOCAL_CFLAGS := $(common_cflags)
LOCAL_MODULE := luac
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := $(common_headers)
LOCAL_STATIC_LIBRARIES := liblua

include $(BUILD_EXECUTABLE)

#---------------------------------------
# Target share library: liblua.so
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(common_core_srcs) $(common_lib_srcs)
LOCAL_CFLAGS := $(common_cflags)
LOCAL_MODULE := liblua
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := $(common_headers)

include $(BUILD_SHARED_LIBRARY)

#---------------------------------------
# Target static library: liblua.a
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(common_core_srcs) $(common_lib_srcs)
LOCAL_CFLAGS := $(common_cflags)
LOCAL_MODULE := liblua
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := $(common_headers)

include $(BUILD_STATIC_LIBRARY)
