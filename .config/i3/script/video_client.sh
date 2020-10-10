#!/bin/bash

case $1 in
"tencent-video")
    google-chrome-stable https://v.qq.com
    ;;
"bilibili")
    google-chrome-stable https://www.bilibili.com
    ;;
*)
    google-chrome-stable
esac
