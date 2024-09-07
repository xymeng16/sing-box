$TOOLCHAIN = "C:/ohos_sdk/native/llvm"
$env:CC = "$TOOLCHAIN/bin/clang"
$env:CXX = "$TOOLCHAIN/bin/clang++"
$env:LD = "$TOOLCHAIN/bin/clang"
$env:AR = "$TOOLCHAIN/bin/llvm-ar"
$env:GOASM = "$TOOLCHAIN/bin/llvm-as"

$env:GOOS = "android"
$env:GOARCH = "arm64"
$env:GOARM = ""
$env:CGO_ENABLED = "0"

$env:BASE_FLAGS = "--sysroot=C:/ohos_sdk/native/sysroot -fdata-sections -ffunction-sections -funwind-tables
-fstack-protector-strong -no-canonical-prefixes -fno-addrsig -Wa,--noexecstack -fPIC"

$env:CGO_CFLAGS = "-Wno-error --target=aarch64-linux-ohos $env:BASE_FLAGS"
$env:CGO_CXXFLAGS=$env:CGO_CFLAGS
$env:CGO_LDFLAGS = "-extar=$env:AR -extld=$env:LD --sysroot=C:/ohos_sdk/native/sysroot --target=aarch64-linux-ohos"

$TARGET_DIR = "aarch64-linux-ohos"
$OUTPUT = "build/$TARGET_DIR/libsb.so"
$OUTPUT_EXEC = "build/$TARGET_DIR/sb"
# compress so
# -trimpath -ldflags="-s -w"
go env
Pause
#go build -buildmode c-shared -v -x -o $OUTPUT ./cmd/sing-box
go build -v -x -o $OUTPUT_EXEC ./cmd/sing-box