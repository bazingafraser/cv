#!/bin/bash
ps -ef|grep elasticsearch.py
if [ $? -ne 0 ];then
nohup /usr/bin/python2  /var/lib/jmxtrans/elasticsearch.py &
fi
