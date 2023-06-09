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
current=`date "+%Y%m%d-%H_%M_%S"`
ENV=`git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3`
TAG="$ENV.$current"

if [ $# -gt 0 ]; then
  TAG="$1.$current"
fi

ossutil64 -c ./hacks/.config -f --recursive cp build/web/ oss://wetee-dtim
