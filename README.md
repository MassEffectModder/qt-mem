### This is customised Qt5 for MEM ###

# Windows #
This is MSYS2 Qt5 package customised for MEM

### Requirements ###
 - MSYS2

### Installation ###
 - Install MSYS2
 - Run 'MSYS2 Mingw 64-bit' shell
 - From shell install GCC x86_64 toolchan using command `pacman -S mingw-w64-x86_64-toolchain`
 From shell enter this repositorium directory and copy 'qt-5.15' to home folder using command `cp -R qt-5.15 ~/`
 - From shell enter 'qt-5.15' directory using command `cd ~/qt-5.15` and then run command `MINGW_ARCH=mingw64 makepkg-mingw -fsiL` to build a binary package.

### Prebuilded package binary ###

 - https://www.dropbox.com/s/87xpw3rlsx750mt/mingw-w64-x86_64-qt5-mem-5.15.4-1-any.pkg.tar.zst?dl=0

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
- From shell enter execute command to build Qt from sources, provide installation path. for example '/opt/stuff/MEM/qt-5.15.4-mem'

`./build_unix.sh /opt/stuff/MEM/qt-5.15.4-mem`
