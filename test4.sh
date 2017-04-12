#!/bin/bash
#通过单引号 可运行命令
DATE=`date`
echo "Current date is $DATE"

USERS=`who`
echo "Current users are $USERS"

UPDATETIME=`uptime`
echo "Uptime is $UPDATETIME"
