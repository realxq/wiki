#!/bin/bash

#################################
##########git自动提交##########
#################################


dates=`date "+%Y-%m-%d"` #日期
times=`date "+%H:%M:%S"` #时间

logs=/www/wwwlogs/$dates.log #日志


echo "==========="$times"===========" >> $logs


project_root="/www/wwwroot/wiki"

cd $project_root

isAdd=$(git status | grep "git add" | wc -l) #判断是否需要提交


if [ $isAdd -gt 0 ];then
    git add .
    git commit -m 自动提交_$dates_$times
    git push origin master
    echo "+提交完成" $path >> $logs
else
    echo "-没有更改" $path >> $logs
fi



