#!/bin/bash

case $1 in
"tencent-video")
    $BROWSER https://v.qq.com
    ;;
"bilibili")
    $BROWSER https://www.bilibili.com
    ;;
*)
    $BROWSER
esac
