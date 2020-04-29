if [[ -z "$(ps -e | grep -o xsettingsd)"  ]]
then
    /usr/bin/xsettingsd &
fi
/opt/deepinwine/apps/Deepin-WeChat/run.sh
