### This is customised Qt5 for MEM ###

# Windows #
This is MSYS2 Qt6 package customised for MEM

### Requirements ###
 - MSYS2

### Installation ###
 - Install MSYS2
 - Run 'MSYS2 MINGW64' terminal
 - From terminal install 'git and make' `pacman -S mingw-w64-x86_64-make`

### Installation from sources ###
 - Follow instructions in terminal:
 - Clone repository `git clone https://github.com/MassEffectModder/qt-mem.git`
 - Copy 'qt-6.6' to home folder (this is important step to avoid too long paths) `cp -R qt-mem/qt-6.6 ~/`
 - Enter 'qt-6.6' directory `cd ~/qt-6.6`
 - Build package `MINGW_ARCH=clang64 makepkg-mingw -fsiL`

### Installation using prebuilded package ###
 - Follow instructions in terminal:
 - Download package `wget https://www.dropbox.com/scl/fi/t6bmyjxgii381t9jrxuay/mingw-w64-clang-x86_64-qt6-static-mem-6.6.2-1-any.pkg.tar.zst?rlkey=jxzy2x3vruz4abpadqhq16so1&dl=0 -O mingw-w64-clang-x86_64-qt6-static-mem-6.6.2-1-any.pkg.tar.zst`
 - Install package `pacman -U mingw-w64-clang-x86_64-qt6-static-mem-6.6.2-1-any.pkg.tar.zst`

# Linux/macOS #
The build script 'build_unix.sh' will compile Qt6 from sources.

### Requirements Linux (Debian/Ubuntu) ###
`sudo apt-get install build-essential perl python git cmake ninja clang '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev`

### Requirements macOS ###
- Xcode from AppStore or using below command from Terminal application:

`xcode-select --install`

### Installation from sources ###
- Run system terminal/console application
- From shell execute below command to download build script:

`wget https://raw.githubusercontent.com/MassEffectModder/qt-mem/master/build_unix.sh && chmod +x build_unix.sh`

- From shell execute below command to build Qt from sources, also provide installation path. for example '/opt/stuff/MEM/qt-6.6.2-mem'

`./build_unix.sh /opt/stuff/MEM/qt-6.6.1-mem`
