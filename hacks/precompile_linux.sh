# 获取当前shell文件的路径
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

cd "$CRATE"

cargo build --release --target=x86_64-unknown-linux-gnu
cp -r "$DIR/../rust_wraper/target/x86_64-unknown-linux-gnu/release/librust_wraper.so" "$DIR/../linux/shared/librust_wraper.so"
