#!/bin/bash
# For deepin-wine-tim startup

if [[ -z "$(ps -e | grep -o xsettingsd)"  ]]
then
    /usr/bin/xsettingsd &
fi
/opt/deepinwine/apps/Deepin-TIM/run.sh
