#!/bin/bash

# 引数が指定されていない場合、エラーメッセージを表示して終了
if [ $# -ne 1 ]; then
  echo "Usage: $0 <source_file.cpp>"
  exit 1
fi

# ソースファイル名を取得
source_file="$1"
file_name_without_extension="${source_file%.cpp}"

# ビルドディレクトリが存在しない場合、作成
build_dir="./build"
mkdir -p "$build_dir"

# ソースファイルをビルドし、実行可能ファイルを build ディレクトリ内に作成
g++ -I/usr/include/opencv4 "$source_file" -std=c++17 -o "$build_dir/$file_name_without_extension" -lopencv_core -lopencv_imgcodecs -lopencv_highgui -lopencv_imgproc -lopencv_videoio

# 実行可能ファイルを実行
"$build_dir/$file_name_without_extension"

