$TOOLCHAIN = "C:/ohos_sdk/native/llvm"
$env:CC = "$TOOLCHAIN/bin/clang"
$env:CXX = "$TOOLCHAIN/bin/clang++"
$env:LD = "$TOOLCHAIN/bin/clang"
$env:AR = "$TOOLCHAIN/bin/llvm-ar"
$env:GOASM = "$TOOLCHAIN/bin/llvm-as"

$env:GOOS = "android"
$env:GOARCH = "arm64"
$env:GOARM = ""
$env:CGO_ENABLED = "1"
$env:CGO_CXXFLAGS=""

$env:CGO_CFLAGS = "-Wno-error --target=aarch64-linux-ohos $BASE_FLAGS"
$env:CGO_LDFLAGS = "-extld=$env:LD --sysroot=C:/ohos_sdk/native/sysroot --target=aarch64-linux-ohos"

$TARGET_DIR = "aarch64-linux-ohos"
$outputFile = "build/$TARGET_DIR/libsb.so"
# compress so
# -trimpath -ldflags="-s -w"
go env
Pause
go build -buildmode c-shared -v -x -o outputFile ./cmd/sing-box