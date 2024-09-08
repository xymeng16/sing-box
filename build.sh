#!/bin/bash

export OHGO="/Users/xiangyi/code/hmos/golang/go/bin/go"

export BASE_FLAGS="--sysroot=$OHOS_NDK_HOME/native/sysroot -fdata-sections -ffunction-sections -funwind-tables -fstack-protector-strong -no-canonical-prefixes -fno-addrsig -Wa,--noexecstack -fPIC"

export TOOLCHAIN=$OHOS_NDK_HOME/native/llvm
export CC="$TOOLCHAIN/bin/clang"
export CXX="$TOOLCHAIN/bin/clang++"
export LD="$TOOLCHAIN/bin/clang"
export AR="$TOOLCHAIN/bin/llvm-ar"

export GOASM="$TOOLCHAIN/bin/llvm-as"
export GOOS="android"
export GOARCH="arm64"
export GOARM=""

export CGO_ENABLED="1"
export CGO_CXXFLAGS=""
export CGO_CFLAGS="-Wno-error --target=aarch64-linux-ohos $BASE_FLAGS"
export CGO_LDFLAGS="-extld=$LD --sysroot=$OHOS_NDK_HOME/native/sysroot --target=aarch64-linux-ohos"

export CGO_CFLAGS_ALLOW="-Wno-error --target=aarch64-linux-ohos $BASE_FLAGS"
export CGO_LDFLAGS_ALLOW="-extld=$LD --sysroot=$OHOS_NDK_HOME/native/sysroot --target=aarch64-linux-ohos"

export TARGET_DIR="aarch64-linux-ohos"
export OUTPUT="build/$TARGET_DIR/libsb.so"
export OUTPUT_EXEC="build/$TARGET_DIR/sb"
export OUTPUT_NAPI="build/$TARGET_DIR/libsb_napi.so"
# compress so
# -trimpath -ldflags="-s -w"
# $OHGO env
# read -p "Press enter to continue"
# $OHGO build -buildmode c-shared -v -x -o $OUTPUT ./cmd/sing-box
#$OHGO build -buildmode c-shared -v -o $OUTPUT ./experimental/libbox
#$OHGO build  -v -o $OUTPUT ./experimental/libbox
$OHGO build -buildmode c-shared -v -x -o $OUTPUT_NAPI ./experimental/ohos