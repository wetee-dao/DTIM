# 来源于网络，用于获取当前shell文件的路径
SOURCE="$0"
while [ -h "$SOURCE"  ]; do
    DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd  )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /*  ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd  )"
CRATE="$DIR/../rust_wraper"

echo "RUST项目根目录 => $CRATE"
cd "$DIR/../"

# 生成自动绑定代码
flutter_rust_bridge_codegen \
    -r $CRATE/src/api.rs \
    -d lib/bridge_generated.dart 

cd "$DIR/../rust_wraper"

# cargo build
# cp -r "$DIR/../rust_wraper/target/debug/librust_wraper.so" "$DIR/../linux/shared/librust_wraper.so"