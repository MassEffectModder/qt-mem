### This is customised Qt5 for MEM ###

# Windows #
This is MSYS2 Qt5 package customised for MEM

### Requirements ###
 - MSYS2

### Installation ###
 - Install MSYS2
 - Run 'MSYS2 MINGW64' terminal
 - From terminal install 'git' `pacman -S git`

### Installation from sources ###
 - Follow instructions in terminal:
 - Clone repository `git clone https://github.com/MassEffectModder/qt-mem.git`
 - Copy 'qt-5.15' to home folder (this is important step to avoid too long paths) `cp -R qt-mem/qt-5.15 ~/`
 - Enter 'qt-5.15' directory `cd ~/qt-5.15`
 - Build package `MINGW_ARCH=mingw64 makepkg-mingw -fsiL`

### Installation using prebuilded package ###
 - Follow instructions in terminal:
 - Download package `wget https://www.dropbox.com/s/zbmin2s0vxlslr8/mingw-w64-x86_64-qt5-static-mem-5.15.8-1-any.pkg.tar.zst?dl=0 -O mingw-w64-x86_64-qt5-static-mem-5.15.8-1-any.pkg.tar.zst`
 - Install package `pacman -U mingw-w64-x86_64-qt5-static-mem-5.15.8-1-any.pkg.tar.zst`

# Linux/macOS #
The build script 'build_unix.sh' will compile Qt5 from sources.

### Requirements Linux (Debian/Ubuntu) ###
`sudo apt-get install build-essential perl python git '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev`

### Requirements macOS ###
- Xcode

`xcode-select --install`

### Installation ###
- Run system Terminal appplication
- From shell enter execute command to download build script:

`wget https://raw.githubusercontent.com/MassEffectModder/qt-mem/master/build_unix.sh && chmod +x build_unix.sh`
- From shell enter execute command to build Qt from sources, provide installation path. for example '/opt/stuff/MEM/qt-5.15.8-mem'

`./build_unix.sh /opt/stuff/MEM/qt-5.15.8-mem`
