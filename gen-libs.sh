#! /bin/sh

# Author: Li Zheng <flyskywhy@gmail.com>
# Automatically generate libs that current app needed.

baseDirForScriptSelf=$(cd "$(dirname "$0")"; pwd)
APP_DIR=${baseDirForScriptSelf}


LIBS_HOST=`echo ${COMMAND_PREFIX} | sed "s/\-$//"`

# libjpeg.a
# cd ${APP_DIR}/..
# [ ! -d jpeg/.git ] && git clone git://git.ghostscript.com/thirdparty/jpeg.git
# cd jpeg
# CONFIGURE="--host=${LIBS_HOST} --enable-shared=no"
# LIBS_HOST_FILE=`find -name config.status`
# if [ 777 != 777${LIBS_HOST_FILE} ]; then
#     if [ 0 = `grep ${LIBS_HOST} -c ${LIBS_HOST_FILE}` ]; then
#         ./configure ${CONFIGURE} CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
#         make clean
#     fi
# else
#     ./configure ${CONFIGURE} CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
#     make clean
# fi
# make
# cp .libs/libjpeg.a ${APP_DIR}/
# cd ${APP_DIR}

# libcjson.a
cd ${APP_DIR}/..
[ ! -d cJSON/.git ] && git clone https://github.com/DaveGamble/cJSON -b v1.7.12
cd cJSON
CC=${COMMAND_PREFIX}gcc AR=${COMMAND_PREFIX}ar make
cp *.a ${APP_DIR}/
cd ${APP_DIR}
