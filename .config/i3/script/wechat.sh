#!/bin/bash
# For deepin-wine-wechat startup

if [[ -z "$(ps -e | grep -o xsettingsd)"  ]]
then
    /usr/bin/xsettingsd &
fi
/opt/deepinwine/apps/Deepin-WeChat/run.sh
