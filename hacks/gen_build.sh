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

rm -rf lib/objectbox.g.dart

flutter pub run build_runner build --delete-conflicting-outputs

rm ./lib/components/appicon.dart
iconfont_builder --from ./assets/fonts --to ./lib/components/appicon.dart  --class Appicon