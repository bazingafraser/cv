操作说明：

为了防止在linux下执行操作的时候误操作rm -rf /,或者rm -rf 一些比较重要的目录，我们做以下操作来限制rm的删除

1、下载源码安装包

https://raw.githubusercontent.com/bazingafraser/cv/master/article/rm/safe-rm-0.12.tar.gz

2、具体操作如下

[root@i-ekowjial ~] tar -xvzf safe-rm-0.12.tar.gz

[root@i-ekowjial ~] cd safe-rm-0.12

[root@i-ekowjial safe-rm-0.12]# mv  safe-rm /usr/local/bin/rm

[root@i-ekowjial safe-rm-0.12]# chown root:root /usr/local/bin/rm

[root@i-ekowjial safe-rm-0.12]# vi /etc/profile

最后一行添加：

PATH=/usr/local/bin:/bin:/usr/bin:$PATH

[root@i-ekowjial safe-rm-0.12]# source /etc/profile    环境变量生效

[root@i-ekowjial safe-rm-0.12]# vim /etc/safe-rm.conf

将禁止删除的目录写入该文件，每个目录一行

/\
/boot\
/sbin\
/data/ccc

保存退出即可

[root@i-ekowjial safe-rm-0.12]# 

3、测试

在/data创建一个ccc的目录并写入/etc/safe-rm.conf

保存退出之后删除ccc出现以下返回，证明操作成功

[root@i-ekowjial data]# rm -rf ccc/

safe-rm: skipping ccc/

[root@i-ekowjial data]#


1、将下面脚本添加到某个目录下（例如/data/shell下)\
脚本名称：rm-remove.sh\
脚本内容：\
#!/usr/bin/env bash\
# func: 安全：rm的替换方法\
# Time: 2018/2/1\
# editor: yw\
# --------------------

PARA_CNT=$#\
TRASH_DIR="/data/backup/.zc_trash"\
DATE=`date +%F`\
TRASH_DIR_D=${TRASH_DIR}/${DATE}\
if [ ! -d ${TRASH_DIR_D} ] ;then\
    mkdir -p ${TRASH_DIR_D}\
fi

for i in $*\
do\
    STAMP=`date +%s`\
    if [ ! -d ${TRASH_DIR_D}/${STAMP} ] ;then\
        mkdir -p ${TRASH_DIR_D}/${STAMP}\
    fi\
    pwdname=`dirname ${i}`\
    filename=`basename ${i}`\
    mv ${i} ${TRASH_DIR_D}/${STAMP}/\
    echo "rm ${pwdname}/${filename}" >> ${TRASH_DIR_D}/${STAMP}/${STAMP}.log

done\
2、创建回收站目录\
[root@i-ekowjial shell]# mkdir /data/backup/.zc_trash\
3、添加环境变量\
[root@i-ekowjial shell]# vim ~/.bashrc\
在alias的最后一行添加脚本执行方式\
alias rm="sh /data/shell/rm-remove.sh"\
4、环境变量生效\
[root@i-ekowjial ~]# source ~/.bashrc\
5、测试\
在任何目录下新建一个文件或者目录执行rm删除操作会报错\
[root@i-ekowjial ~]# touch cc\
[root@i-ekowjial ~]# rm -f cc\
dirname：无效选项 -- f\
请尝试执行"dirname --help"来获取更多信息。\
basename：无效选项 -- f\
请尝试执行"basename --help"来获取更多信息。\
mv: 在"/data/backup/.zc_trash/2018-02-01/1517462127/" 后缺少了要操作的目标文件\
请尝试执行"mv --help"来获取更多信息\
[root@i-ekowjial ~]# \
我们执行了rm操作之后发现当前目录下确实cc文件已经不存在了，但是我们只是对该文件做了mv 的操作，并没有真的删除，\
6、切换到回收站目录下查看\
[root@i-ekowjial shell]# cd /data/backup/.zc_trash/\
[root@i-ekowjial .zc_trash]# ls\
2018-02-01\
[root@i-ekowjial .zc_trash]#\
我们可以看到当前目录下有一个时间目录，进入之后会看到一个unix时间为名称的目录\
[root@i-ekowjial .zc_trash]# cd 2018-02-01/\
[root@i-ekowjial 2018-02-01]# ls\
1517462127\
[root@i-ekowjial 2018-02-01]#\
我们使用unxi解码工具\
[root@i-ekowjial 2018-02-01]# date -d @1517462127 +"%Y-%m-%d %H:%M:%S"\
2018-02-01 13:15:27\
[root@i-ekowjial 2018-02-01]#\
进入这个目录之后看到一个log文件和我们刚才rm的cc文件\
[root@i-ekowjial 2018-02-01]# cd 1517462127/\
[root@i-ekowjial 1517462127]# ls\
1517462127.log  cc\
[root@i-ekowjial 1517462127]#\
查看日志内容为我们刚才执行的rm操作命令\
[root@i-ekowjial 1517462127]# cat 1517462127.log\
rm /\
rm ./cc\
[root@i-ekowjial 1517462127]#\
7、综上：我们做了以上限制之后，删除的东西会mv到这个回收站目录下并且会以unix时间为目录
