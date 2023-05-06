# 获取当前shell文件的路径
SOURCE="$0"
while [ -h "$SOURCE"  ]; do
    DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd  )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /*  ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd  )"
cd "$DIR/"

SHARE_BUILD="$DIR/../linux/shared"
if [ -d "$SHARE_BUILD" ];then
    rm -rf "$SHARE_BUILD"
fi
mkdir -p "$SHARE_BUILD"

echo "开始下载预编译文件..."

cd "$SHARE_BUILD"

curl -# -O https://wetee.app/precompile/librust_wraper.so

# brew install libolm
# cp /opt/homebrew/Cellar/libolm/3.2.14/lib/libolm.3.2.14.dylib /Users/asyou/Work/asyou.me/app