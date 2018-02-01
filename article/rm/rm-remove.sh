#!/usr/bin/env bash
# func: 安全：rm的替换方法
# Time: 2018-02-01
# editor: yw
# --------------------

PARA_CNT=$#
TRASH_DIR="/data/backup/.zc_trash"
DATE=`date +%F`
TRASH_DIR_D=${TRASH_DIR}/${DATE}
if [ ! -d ${TRASH_DIR_D} ] ;then
    mkdir -p ${TRASH_DIR_D}
fi

for i in $*
do
    STAMP=`date +%s`
    if [ ! -d ${TRASH_DIR_D}/${STAMP} ] ;then
        mkdir -p ${TRASH_DIR_D}/${STAMP}
    fi
    pwdname=`dirname ${i}`
    filename=`basename ${i}`
    mv ${i} ${TRASH_DIR_D}/${STAMP}/
    echo "rm ${pwdname}/${filename}" >> ${TRASH_DIR_D}/${STAMP}/${STAMP}.log

done
