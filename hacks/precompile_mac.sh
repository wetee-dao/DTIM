# 获取当前shell文件的路径
SOURCE="$0"
while [ -h "$SOURCE"  ]; do
    DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd  )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /*  ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd  )"
cd "$DIR/"

MAC_BUILD="$DIR/../build/macos/Build/Intermediates.noindex/rust_wraper.build"
if [ -d "$MAC_BUILD" ];then
    rm -rf "$MAC_BUILD"
fi
mkdir -p "$MAC_BUILD"

echo "开始下载预编译文件..."

cd "$MAC_BUILD"

curl -# -O https://wetee.app/precompile/cargo_target.zip
tar -xvf cargo_target.zip
rm -rf cargo_target.zip

# brew install libolm
# cp /opt/homebrew/Cellar/libolm/3.2.14/lib/libolm.3.2.14.dylib /Users/asyou/Work/asyou.me/app