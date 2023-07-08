# get shell path
SOURCE="$0"
while [ -h "$SOURCE"  ]; do
    DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd  )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /*  ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd  )"

rm -rf build/macos/Build/Products/Release/DTIM.app

### Make release build ###
flutter build macos --release

# cp "$HOMEBREW_CELLAR/libolm/3.2.15/lib/libolm.3.2.15.dylib" build/macos/Build/Products/Release/DTIM.app/Contents/Frameworks/
# mv build/macos/Build/Products/Release/DTIM.app/Contents/Frameworks/libolm.3.2.15.dylib build/macos/Build/Products/Release/DTIM.app/Contents/Frameworks/libolm.3.dylib

# echo "Build build/macos/Build/Products/Release/DTIM.app"
