This is MSYS2 Qt5 package customised for MEM.

### Requirements ###
 - MSYS2 x86_64
 - DirectX Shader Compiler 'fxc.exe' from DirectX9 SDK or Windows 10 SDK

### Installation ###
 - Copy 'fxc.exe' to directory on the %PATH% variable or add path location to 'fxc.exe' to %PATH% variable
 - Install MSYS2 x86_64 using MSYS2 installer
 - Run 'MSYS2 Mingw 64-bit' shell
 - From shell install GCC x86_64 toolchan using command 'pacman -S mingw-w64-x86_64-toolchain'
 - From shell enter this repositorium directory and copy 'qt-5.12' to home folder using command:
   'cp -R qt-5.12 ~/'
 - From shell enter 'qt-5.12' directory using command 'cd ~/qt-5.12' and run command 'makepkg-mingw -fsiL' to build a binary package.

### Prebuilded package binary ###

https://www.dropbox.com/s/tijh42kmky0uogt/mingw-w64-x86_64-qt5-mem-5.12.10-1-any.pkg.tar.zst?dl=0
