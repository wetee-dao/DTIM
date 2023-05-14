# get shell path
SOURCE="$0"
while [ -h "$SOURCE"  ]; do
    DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd  )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /*  ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd  )"
cd "$DIR/"

# brew install libolm
MAC_BUILD="$DIR/../build/macos/Build/Intermediates.noindex/rust_wraper.build/cargo_target/aarch64-apple-darwin"
if [ -d "$MAC_BUILD" ];then
    rm -rf "$MAC_BUILD"
fi
mkdir -p "$MAC_BUILD"

echo "开始下载预编译文件..."

cd "$MAC_BUILD"

curl -# -O https://wetee.app/precompile/debug.zip
tar -xvf debug.zip
rm -rf debug.zip
cp -r debug release

MAC86_BUILD="$DIR/../build/macos/Build/Intermediates.noindex/rust_wraper.build/cargo_target/x86_64-apple-darwin"
if [ -d "$MAC86_BUILD" ];then
    rm -rf "$MAC86_BUILD"
fi
mkdir -p "$MAC86_BUILD"

cd "$MAC86_BUILD"
curl -# -O https://wetee.app/precompile/debug86.zip

tar -xvf debug86.zip
rm -rf debug86.zip
cp -r debug release