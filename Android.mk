 ##################################################################
 #                     GNU BACKGAMMON MOBILE                      #
 ##################################################################
 #                                                                #
 #  Authors: Domenico Martella - Davide Saurino                   #
 #  E-mail: info@alcacoop.it                                      #
 #  Date:   19/12/2012                                            #
 #                                                                #
 ##################################################################
 #                                                                #
 #  Copyright (C) 2012   Alca Societa' Cooperativa                #
 #                                                                #
 #  This file is part of GNU BACKGAMMON MOBILE.                   #
 #  GNU BACKGAMMON MOBILE is free software: you can redistribute  # 
 #  it and/or modify it under the terms of the GNU General        #
 #  Public License as published by the Free Software Foundation,  #
 #  either version 3 of the License, or (at your option)          #
 #  any later version.                                            #
 #                                                                #
 #  GNU BACKGAMMON MOBILE is distributed in the hope that it      #
 #  will be useful, but WITHOUT ANY WARRANTY; without even the    #
 #  implied warranty of MERCHANTABILITY or FITNESS FOR A          #
 #  PARTICULAR PURPOSE.  See the GNU General Public License       #
 #  for more details.                                             #
 #                                                                #
 #  You should have received a copy of the GNU General            #
 #  Public License v3 along with this program.                    #
 #  If not, see <http://http://www.gnu.org/licenses/>             #
 #                                                                #
 ##################################################################


include $(CLEAR_VARS)  

LOCAL_PATH := $(call my-dir)  
LOCAL_PATH := /home/dmt/Progetti/gnubg-android/
GLIB_TOP   := $(LOCAL_PATH)/glib/


include $(call all-subdir-makefiles)

include $(GLIB_TOP)glib/Android.mk
include $(GLIB_TOP)gthread/Android.mk


LOCAL_PATH := /home/dmt/Progetti/gnubg-android/
LOCAL_SRC_FILES := \
    lib/list.c \
    lib/neuralnet.c \
    lib/mt19937ar.c \
    lib/isaac.c \
    lib/md5.c \
    lib/cache.c \
    lib/inputs.c \
    globals.c \
    async.c \
    dice.c \
    eval.c \
    bearoff.c \
    bearoffgammon.c \
    imported_functions.c \
		jniAPI.c \
    levels.c \
    matchequity.c \
    matchid.c \
    nativeAPI.c \
    util.c \
    mec.c \
    positionid.c \
    rollout.c \
    test.c


LOCAL_CFLAGS := -ffast-math -O3 -funroll-loops
LOCAL_C_INCLUDES := $(LOCAL_PATH)/lib $(SYSROOT)/usr/lib 
LOCAL_LDLIBS := -llog
LOCAL_MODULE := libgnubg
LOCAL_MODULE_FILENAME := libgnubg

LOCAL_SHARED_LIBRARIES := libgthread-2.0 libglib-2.0


GLIB_C_INCLUDES :=			\
	$(GLIB_TOP)			\
	$(GLIB_TOP)glib/glib		\
	$(GLIB_TOP)glib/android \
	$(GLIB_TOP)glib/android-internal

LOCAL_CFLAGS=-DIS_LIBRARY -DIS_ANDROID -DHAVE_CONFIG_H -g -O2 -DLOCALEDIR=\"/usr/share/locale\" -pthread -DAC_DATADIR=\"/usr/share\" -DAC_PKGDATADIR=\"/usr/share/gnubg\" -DAC_DOCDIR=\"/usr/share/doc/gnubg/\" -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -w

LOCAL_C_INCLUDES :=			\
	$(GLIB_TOP)			\
	$(LOCAL_PATH)lib 	\
	$(GLIB_TOP)glib		\
	$(GLIB_TOP)android-internal \
	$(GLIB_TOP)android

GTHREAD_C_INCLUDES :=			\
	$(GLIB_C_INCLUDES)		\
	$(GLIB_TOP)gthread

GLIB_SHARED_LIBRARIES := \
	libgthread-2.0 \
	libglib-2.0

include $(BUILD_SHARED_LIBRARY) 

include $(shell cp -rf libs/armeabi/* /home/dmt/Progetti/Android/workspace/gnubg-gdx/Backgammon-android/libs/armeabi/)  
include $(shell cp -rf libs/armeabi/* /home/dmt/Progetti/Android/workspace/gnubg-gdx/GnuBackgammon-android/libs/armeabi/)  

include $(shell cp -rf libs/armeabi-v7a/* /home/dmt/Progetti/Android/workspace/gnubg-gdx/Backgammon-android/libs/armeabi-v7a/)  
include $(shell cp -rf libs/armeabi-v7a/* /home/dmt/Progetti/Android/workspace/gnubg-gdx/GnuBackgammon-android/libs/armeabi-v7a/)  

include $(shell cp -rf libs/x86/* /home/dmt/Progetti/Android/workspace/gnubg-gdx/Backgammon-android/libs/x86/)  
include $(shell cp -rf libs/x86/* /home/dmt/Progetti/Android/workspace/gnubg-gdx/GnuBackgammon-android/libs/x86/)  
