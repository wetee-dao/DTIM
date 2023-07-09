#!/bin/sh

# 来源于网络，用于获取当前shell文件的路径
SOURCE="$0"
while [ -h "$SOURCE"  ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd  )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /*  ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd  )"

cd "$DIR/../"

rm -r web/js
mkdir -p web/js
cd web/js/ && curl -L 'https://gitlab.com/famedly/company/frontend/libraries/olm/-/jobs/artifacts/master/download?job=build:js' > olm.zip && cd ../../
cd web/js/ && unzip olm.zip && cd ../../
cd web/js/ && rm olm.zip && cd ../../
cd web/js/ && mv javascript olm && cd ../../

flutter build web --release

ossutil64 -c ./hacks/.config -f --recursive cp build/web/ oss://wetee-dtim
