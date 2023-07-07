# get shell path
SOURCE="$0"
while [ -h "$SOURCE"  ]; do
    DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd  )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /*  ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd  )"
CRATE="$DIR/../rust_wraper"

echo "RUST ROOT => $CRATE"
cd "$CRATE"

cargo build --target=x86_64-pc-windows-msvc --release
cp -r "$DIR/../rust_wraper/target/x86_64-pc-windows-msvc/release/rust_wraper.dll" "$DIR/../windows/shared/rust_wraper.dll"

#export https_proxy=http://127.0.0.1:7890;export http_proxy=http://127.0.0.1:7890;export all_proxy=socks5://127.0.0.1:7890