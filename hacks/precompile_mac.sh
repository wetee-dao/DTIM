# get shell path
SOURCE="$0"
while [ -h "$SOURCE"  ]; do
    DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd  )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /*  ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd  )"
CRATE="$DIR/../rust_wraper"
MAC_BUILD="$DIR/../build/macos/Build/Intermediates.noindex/rust_wraper.build/cargo_target/aarch64-apple-darwin"
MAC86_BUILD="$DIR/../build/macos/Build/Intermediates.noindex/rust_wraper.build/cargo_target/x86_64-apple-darwin"

echo "RUST ROOT => $CRATE"
cd "$CRATE"
# brew install libolm
# cp /opt/homebrew/Cellar/libolm/3.2.14/lib/libolm.3.2.14.dylib /Users/asyou/Work/asyou.me/app

cargo build --release --target=aarch64-apple-darwin
if [ -d "$MAC_BUILD" ];then
    rm -rf "$MAC_BUILD"
fi
mkdir -p "$MAC_BUILD"
mkdir -p "$MAC_BUILD/debug"
mkdir -p "$MAC_BUILD/debug/deps"

cp ./target/aarch64-apple-darwin/release/librust_wraper.a "$MAC_BUILD/debug/librust_wraper.a"
cp ./target/aarch64-apple-darwin/release/librust_wraper.d "$MAC_BUILD/debug/librust_wraper.d"
cp ./target/aarch64-apple-darwin/release/librust_wraper.dylib "$MAC_BUILD/debug/librust_wraper.dylib"
cp ./target/aarch64-apple-darwin/release/librust_wraper.rlib "$MAC_BUILD/debug/librust_wraper.rlib"
cp ./target/aarch64-apple-darwin/release/librust_wraper.dylib "$MAC_BUILD/debug/deps/librust_wraper.dylib"


cargo build --release --target=x86_64-apple-darwin
if [ -d "$MAC86_BUILD" ];then
    rm -rf "$MAC86_BUILD"
fi
mkdir -p "$MAC86_BUILD"
mkdir -p "$MAC86_BUILD/debug"
mkdir -p "$MAC86_BUILD/debug/deps"

cp ./target/x86_64-apple-darwin/release/librust_wraper.a "$MAC86_BUILD/debug/librust_wraper.a"
cp ./target/x86_64-apple-darwin/release/librust_wraper.d "$MAC86_BUILD/debug/librust_wraper.d"
cp ./target/x86_64-apple-darwin/release/librust_wraper.dylib "$MAC86_BUILD/debug/librust_wraper.dylib"
cp ./target/x86_64-apple-darwin/release/librust_wraper.rlib "$MAC86_BUILD/debug/librust_wraper.rlib"
cp ./target/x86_64-apple-darwin/release/librust_wraper.dylib "$MAC86_BUILD/debug/deps/librust_wraper.dylib"
