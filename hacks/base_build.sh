# get shell path
SOURCE="$0"
while [ -h "$SOURCE"  ]; do
    DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd  )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /*  ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd  )"

flutter pub run build_runner build --delete-conflicting-outputs

# rm ./lib/components/appicon.dart
# iconfont_builder --from ./assets/fonts --to ./lib/components/appicon.dart  --class Appicon