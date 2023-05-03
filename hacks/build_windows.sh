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

cd "$DIR/../rust_wraper"

rm ./Cargo.lock
cargo build --release
cp -r "$DIR/../rust_wraper/target/release/rust_wraper.dll" "$DIR/../windows/shared/rust_wraper.dll"