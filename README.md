This is MSYS2 Qt5 package customised for MEM.

### Requirements ###
 - DirectX Shader Compiler 'fxc.exe' from Windows 10 SDK
 - MSYS2

### Installation ###
 - Copy 'fxc.exe' to directory on the %PATH% variable or add path location to 'fxc.exe' to %PATH% variable
 - Install MSYS2
 - Run 'MSYS2 Mingw 64-bit' shell
 - From shell install GCC x86_64 toolchan using command 'pacman -S mingw-w64-x86_64-toolchain'
 - From shell enter this repositorium directory and copy 'qt-5.15' to home folder using command 'cp -R qt-5.15 ~/'
 - From shell enter 'qt-5.15' directory using command 'cd ~/qt-5.15' and run command 'makepkg-mingw -fsiL' to build a binary package.

### Prebuilded package binary ###

 - 5.15

https://www.dropbox.com/s/z41q38iay29gwj1/mingw-w64-x86_64-qt5-mem-5.15.2-1-any.pkg.tar.zst?dl=0

 - 5.12

https://www.dropbox.com/s/tijh42kmky0uogt/mingw-w64-x86_64-qt5-mem-5.12.10-1-any.pkg.tar.zst?dl=0
