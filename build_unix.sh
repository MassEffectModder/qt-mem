#!/bin/bash

#
# MIT License
#
# Copyright (c) 2021-2025 Pawel Kolodziejski
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

QT_VERSION=6.8.3
QT_VERSION_BASE=`echo $QT_VERSION | cut -d'.' -f 1,2`

NUM_THREADS=1
INSTALL_PATH=/opt/stuff/MEM/qt-$QT_VERSION-mem
if [ "$1" != "" ]; then
	INSTALL_PATH=$1
fi

COMMON_OPTS="\
-Wno-dev --log-level=STATUS -G Ninja -DBUILD_SHARED_LIBS=OFF -DFEATURE_static_runtime=ON \
-DINPUT_zlib=qt -DINPUT_pcre=qt -DINPUT_libpng=qt -DINPUT_libjpeg=qt -DINPUT_doubleconversion=qt \
-DINPUT_harfbuzz=qt -DINPUT_opengl=OFF -DFEATURE_dbus=OFF -DFEATURE_icu=OFF -DFEATURE_cups=OFF \
-DFEATURE_gif=OFF -DFEATURE_ico=OFF -DFEATURE_eglfs=OFF -DFEATURE_gbm=OFF -DFEATURE_tiff=OFF \
-DFEATURE_webp=OFF -DFEATURE_journald=OFF -DFEATURE_syslog=OFF \
-DFEATURE_slog2=OFF -DFEATURE_feature-relocatable=OFF -DFEATURE_opengl=OFF \
-DQT_BUILD_TESTS=OFF -DQT_BUILD_EXAMPLES=OFF \
-DBUILD_qt3d=OFF -DBUILD_qt5compat=OFF -DBUILD_qtactiveqt=OFF -DBUILD_qtcoap=OFF -DBUILD_qtcharts=OFF \
-DBUILD_qtconnectivit=OFF -DBUILD_qtdatavis3d=OFF -DBUILD_qtdeclarative=OFF -DBUILD_qtdoc=OFF \
-DBUILD_qtgrpc=OFF -DBUILD_qtgraphs=OFF -DBUILD_qthttpserver=OFF -DBUILD_qtgraphicaleffects=OFF \
-DBUILD_qttools=ON -DBUILD_qtlocation=OFF -DBUILD_qtlottie=OFF -DBUILD_qtmqtt=OFF -DBUILD_qtmultimedia=OFF \
-DBUILD_qtnetworkauth=OFF -DBUILD_qtopcua=OFF -DBUILD_qtpositioning=OFF -DBUILD_qtquick3d=OFF \
-DBUILD_qtquick3dphysics=OFF -DBUILD_qtquickeffectmaker=OFF -DBUILD_qtquicktimeline=OFF \
-DBUILD_qtremoteobjects=OFF -DBUILD_qtscxml=OFF -DBUILD_qtsensors=OFF -DBUILD_qtserialbus=OFF \
-DBUILD_qtserialport=OFF -DBUILD_qtshadertools=OFF -DBUILD_qtspeech=OFF -DBUILD_qtsvg=OFF \
-DBUILD_qttools=OFF -DBUILD_qttranslations=OFF -DBUILD_qtvirtualkeyboard=OFF -DBUILD_qtwayland=OFF \
-DBUILD_qtwebchannel=OFF -DBUILD_qtwebengine=OFF -DBUILD_qtwebsockets=OFF -DBUILD_qtwebview=OFF \
"

case `uname -s` in
	'Linux')
		COMMON_OPTS="$COMMON_OPTS -DQT_QMAKE_TARGET_MKSPEC=linux-clang -DFEATURE_glib=ON -DFEATURE_system_freetype=ON \
                             -DFEATURE_system_fontconfig=ON -DINPUT_qpa=xcb -DFEATURE_xcb=ON -DFEATURE_xcb-native-painting=ON"
		NUM_THREADS=`grep -c '^processor' /proc/cpuinfo`
	;;
	'Darwin')
		COMMON_OPTS="$COMMON_OPTS -DQT_QMAKE_TARGET_MKSPEC=macx-clang -DFEATURE_glib=OFF -DINPUT_freeetype=qt"
		NUM_THREADS=`sysctl -n hw.ncpu`
	;;
esac

if [ ! -f "qt-everywhere-src-$QT_VERSION.tar.xz" ]; then
	wget https://download.qt.io/archive/qt/$QT_VERSION_BASE/$QT_VERSION/single/qt-everywhere-src-$QT_VERSION.tar.xz
	if [ $? != 0 ]; then
		echo "ERROR: Failed to download Qt sources!"
		exit 1
	fi
fi

if [ ! -d "qt-everywhere-src-$QT_VERSION" ]; then
	tar xf qt-everywhere-src-$QT_VERSION.tar.xz
	if [ $? != 0 ]; then
		echo "ERROR: Failed to unpack Qt archive!"
		exit 1
	fi
	pushd qt-everywhere-src-$QT_VERSION
	rm qtbase/cmake/FindWrapZSTD.cmake
	touch qtbase/cmake/FindWrapZSTD.cmake
	#cat ../patches/patch | patch -p1
	popd
fi

pushd qt-everywhere-src-$QT_VERSION
./configure -- $COMMON_OPTS -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${INSTALL_PATH}-release && cmake --build . --parallel $NUM_THREADS && cmake --install .
./configure -- $COMMON_OPTS -DCMAKE_BUILD_TYPE=Debug   -DCMAKE_INSTALL_PREFIX=${INSTALL_PATH}-debug   && cmake --build . --parallel $NUM_THREADS && cmake --install .
popd
