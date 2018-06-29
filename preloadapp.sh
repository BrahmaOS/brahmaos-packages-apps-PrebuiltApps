#!/system/bin/sh                                                                                                                                                       
#
# preloadapp.sh
# Copyright (C) 2018 Winton.Liu <admin@brahmaos.io>
#
# Distributed under terms of the MIT license.
#

PRELOAD_APK=/system/preloadapp
DATA_APK=/data/app
echo "PRELOAD_APK=${PRELOAD_APK}"
PREINSTALL_RESULT="`getprop persist.sys.preloadapp.value`"
echo "PREINSTALL_RESULT=${PREINSTALL_RESULT}"
apk_files=""
if [ "$PREINSTALL_RESULT" != "1" ]; then
        cd ${PRELOAD_APK}
        apk_files=$(ls *.apk )
        for apkfile in $apk_files
        do 
                echo " apkfile = ${apkfile} "
                cp -vf ${PRELOAD_APK}/${apkfile} ${DATA_APK}
                chmod 777 ${DATA_APK}/${apkfile}
        done 
        # set preloadapp flag
        setprop persist.sys.preloadapp.value 1
        cd ../..
else
	echo "Already copy"

fi

