#!/bin/bash
#
# Copyright (c) 2021 CloudedQuartz
#

# Script to set up environment to build an android kernel
# Assumes required packages are already installed

# Config
CURRENT_DIR="$(pwd)"
KERNELNAME="Delta"
KERNEL_DIR="$CURRENT_DIR"
AK_REPO="https://github.com/TheStaticDesign/AnyKernel3"
AK_DIR="$HOME/AnyKernel3"
TC_DIR="$HOME"
# End Config

# clone_tc - clones proton clang to TC_DIR
clone_tc() {
	git clone --depth=1 https://github.com/mvaisakh/gcc-arm64 $TC_DIR/arm64
	git clone --depth=1 https://github.com/mvaisakh/gcc-arm  $TC_DIR/arm
}

# Clones anykernel
clone_ak() {
	git clone $AK_REPO $AK_DIR
}
# Actually do stuff
clone_tc
clone_ak

# Run build script
. ${CURRENT_DIR}/kernel_build.sh
