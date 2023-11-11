 # get shell path
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

 
 flutter pub run polkadart_cli:generate -v