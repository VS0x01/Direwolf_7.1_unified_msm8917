#!/bin/bash

#VS0x01 kernel build script

WORKSPACE=/home/vs0x01/xiaomi_kernel_workspace
KERNEL_DIR=$PWD
ZIMAGE=$KERNEL_DIR/out/arch/arm64/boot/Image.gz-dtb

export ARCH=arm64
export SUBARCH=arm64
export KBUILD_BUILD_USER="VS0x01"
export KBUILD_BUILD_HOST="vs0x01_dell"
export CROSS_COMPILE=$WORKSPACE/aarch64-linux-android-4.9/bin/aarch64-linux-android-

compile () {
	make clean && make mrproper
	make rolex_defconfig
	make -j$(nproc --all)
	if ! [ -a $ZIMAGE ];
		then
		echo "Build failed!"
		exit 1
	fi
	echo "Build success!"
}

compile
