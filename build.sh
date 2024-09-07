#!/bin/bash

TOOLCHAIN=$OHOS_NDK_HOME
CC="$TOOLCHAIN/bin/clang"
CXX="$TOOLCHAIN/bin/clang++"
LD="$TOOLCHAIN/bin/clang"
AR="$TOOLCHAIN/bin/llvm-ar"
GOASM="$TOOLCHAIN/bin/llvm-as"

GOOS="android"
GOARCH="arm64"
GOARM=""
CGO_ENABLED="1"
CGO_CXXFLAGS=""

CGO_CFLAGS="-Wno-error --target=aarch64-linux-ohos $BASE_FLAGS"
CGO_LDFLAGS="-extld=$LD --sysroot=C:/ohos_sdk/native/sysroot --target=aarch64-linux-ohos"

TARGET_DIR="aarch64-linux-ohos"
outputFile="build/$TARGET_DIR/libsb.so"
# compress so
# -trimpath -ldflags="-s -w"
go env
read -p "Press enter to continue"
go build -buildmode c-shared -v -x -o outputFile ./cmd/sing-box