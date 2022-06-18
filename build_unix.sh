#!/bin/sh

#
# MIT License
#
# Copyright (c) 2021-2022 Pawel Kolodziejski
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

QT_VERSION=5.15.5
QT_VERSION_BASE=`echo $QT_VERSION | cut -d'.' -f 1,2`

NUM_THREADS=1
INSTALL_PATH=/opt/stuff/MEM/qt-$QT_VERSION-mem
if [ "$1" != "" ]; then
	INSTALL_PATH=$1
fi

COMMON_OPTS="\
-prefix $INSTALL_PATH -static -qt-zlib -qt-pcre -qt-libpng -qt-libjpeg -system-freetype -no-dbus \
-iconv -no-icu -glib -no-cups -no-gif -no-ico -qt-harfbuzz -no-eglfs -no-gbm -no-mimetype-database \
-no-feature-relocatable -no-opengl -make libs -nomake examples -nomake tests -skip qt3d -skip qtactiveqt \
-skip qtcanvas3d -skip qtcharts -skip qtconnectivity -skip qtdatavis3d -skip qtdeclarative -skip qtdoc \
-skip gamepad -skip qtgraphicaleffects -skip qtlocation -skip qtmultimedia -skip qtnetworkauth \
-skip qtpurchasing -skip qtquickcontrols -skip qtquickcontrols2 -skip qtremoteobjects -skip qtscript \
-skip qtscxml -skip qtsensors -skip qtserialbus -skip qtserialport -skip qtspeech -skip qttools \
-skip qttranslations -skip qtvirtualkeyboard -skip qtwebengine -skip qtwebglplugin -skip qtwebsockets \
-skip qtwebview -skip qtxmlpatterns -confirm-license -opensource"

case `uname -s` in
	'Linux')
		COMMON_OPTS="$COMMON_OPTS -platform linux-clang -release -iconv -glib -system-freetype -qt-doubleconversion -fontconfig -qpa xcb -xcb -xcb-native-painting"
		NUM_THREADS=`grep -c '^processor' /proc/cpuinfo`
	;;
	'Darwin')
		COMMON_OPTS="$COMMON_OPTS -debug-and-release -no-iconv -no-glib -qt-freetype -no-doubleconversion"
		NUM_THREADS=`sysctl -n hw.ncpu`
	;;
esac

if [ ! -f "qt-everywhere-opensource-src-$QT_VERSION.tar.xz" ]; then
	wget https://download.qt.io/archive/qt/$QT_VERSION_BASE/$QT_VERSION/single/qt-everywhere-opensource-src-$QT_VERSION.tar.xz
	if [ $? != 0 ]; then
		echo "ERROR: Failed to download Qt sources!"
		exit 1
	fi
fi

if [ ! -d "qt-everywhere-src-$QT_VERSION" ]; then
	tar xf qt-everywhere-opensource-src-$QT_VERSION.tar.xz
	if [ $? != 0 ]; then
		echo "ERROR: Failed to unpack Qt archive!"
		exit 1
	fi
	pushd qt-everywhere-src-$QT_VERSION
	cat ../patches/qiosurfacegraphicsbuffer.patch | patch -p0
	popd
fi

pushd qt-everywhere-src-$QT_VERSION
./configure $COMMON_OPTS && make -j$NUM_THREADS && make install
popd
