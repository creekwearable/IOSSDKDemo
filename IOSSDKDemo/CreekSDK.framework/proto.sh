#!/bin/bash
# create by tian
#  请在终端执行
root_dir=$(pwd)
cd $root_dir
for fliename in $(ls *.proto)
do
  echo "protoc --swift_out=. "$fliename""
  $(protoc --swift_out=. "$fliename")
done


#root_dir=$(pwd)
#cd $root_dir
#for fliename in $(ls *.proto)
#do
#  echo "protoc --swift_out=. "$fliename""
#  $(protoc --python_out=. "$fliename")
#done

