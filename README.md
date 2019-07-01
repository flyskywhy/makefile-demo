# Generic Makefile demo with libcurl.so and libcjson.a

## prepare Generic Makefile for C/C++ Programs
    mkdir ~/tools/
    cd ~/tools/
    git clone https://github.com/flyskywhy/makefile

## x86 version
Make sure there is `/usr/lib/x86_64-linux-gnu/libcurl.so`

    cd makefile-demo
    make clean_libs
    make
    ./mkdemo

## ARM version
    sudo apt install gcc-arm-linux-gnueabihf

Make sure there is `/nfs/rootfs_qt5/usr/lib/libcurl.so`

    cd makefile-demo
    make clean_libs
    SYSROOT=/nfs/rootfs_qt5 make
