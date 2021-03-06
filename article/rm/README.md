
# Func：安全：限制rm -rf /

# Time：2018-02-01

# Editor：Bazinga


1、下载源码安装包

https://raw.githubusercontent.com/bazingafraser/cv/master/article/rm/safe-rm-0.12.tar.gz

2、具体操作如下

[root@localhost ~] tar -xvzf safe-rm-0.12.tar.gz

[root@localhost ~] cd safe-rm-0.12

[root@localhost safe-rm-0.12]# mv  safe-rm /usr/local/bin/rm

[root@localhost safe-rm-0.12]# chown root:root /usr/local/bin/rm

[root@localhost safe-rm-0.12]# vi /etc/profile

最后一行添加：

export PATH=/usr/local/bin:/bin:/usr/bin:$PATH

[root@localhost safe-rm-0.12]# source /etc/profile    环境变量生效

[root@localhost safe-rm-0.12]# vim /etc/safe-rm.conf

将禁止删除的目录写入该文件，每个目录一行

/\
/boot\
/sbin\
/data/ccc

保存退出即可

[root@localhost safe-rm-0.12]# 

3、测试

在/data创建一个ccc的目录并写入/etc/safe-rm.conf

保存退出之后删除ccc出现以下返回，证明操作成功

[root@localhost data]# rm -rf ccc/

safe-rm: skipping ccc/

[root@localhost data]#


# Func: 安全：rm的替换方法（回收站的建立）
# Time: 2018-02-01
# Editor: Bazinga
1、将下面脚本添加到某个目录下（例如/data/shell下)\
脚本名称：rm-remove.sh\
脚本内容：\
#!/usr/bin/env bash\
PARA_CNT=$#\
TRASH_DIR="/data/backup/trash"\
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
[root@localhost shell]# mkdir /data/backup/trash\
3、添加环境变量\
[root@localhost shell]# vim ~/.bashrc\
在alias的最后一行添加脚本执行方式\
alias rm="sh /data/shell/rm-remove.sh"\
4、环境变量生效\
[root@localhost ~]# source ~/.bashrc\
5、测试\
在任何目录下新建一个文件或者目录执行rm删除操作会报错\
[root@localhost ~]# touch cc\
[root@localhost ~]# rm -f cc\
dirname：无效选项 -- f\
请尝试执行"dirname --help"来获取更多信息。\
basename：无效选项 -- f\
请尝试执行"basename --help"来获取更多信息。\
mv: 在"/data/backup/trash/2018-02-01/1517462127/" 后缺少了要操作的目标文件\
请尝试执行"mv --help"来获取更多信息\
[root@localhost ~]# \
我们执行了rm操作之后发现当前目录下确实cc文件已经不存在了，但是我们只是对该文件做了mv 的操作，并没有真的删除，\
6、切换到回收站目录下查看\
[root@localhost shell]# cd /data/backup/trash/\
[root@localhost trash]# ls\
2018-02-01\
[root@localhost trash]#\
我们可以看到当前目录下有一个时间目录，进入之后会看到一个unix时间为名称的目录\
[root@localhost trash]# cd 2018-02-01/\
[root@localhost 2018-02-01]# ls\
1517462127\
[root@localhost 2018-02-01]#\
我们使用unxi解码工具\
[root@localhost 2018-02-01]# date -d @1517462127 +"%Y-%m-%d %H:%M:%S"\
2018-02-01 13:15:27\
[root@localhost 2018-02-01]#\
进入这个目录之后看到一个log文件和我们刚才rm的cc文件\
[root@localhost 2018-02-01]# cd 1517462127/\
[root@localhost 1517462127]# ls\
1517462127.log  cc\
[root@localhost 1517462127]#\
查看日志内容为我们刚才执行的rm操作命令\
[root@localhost 1517462127]# cat 1517462127.log\
rm /\
rm ./cc\
[root@localhost 1517462127]#\
7、综上：我们做了以上限制之后，删除的东西会mv到这个回收站目录下并且会以unix时间为目录


注意：该脚本解释权归bazingafraser所有，转载请注明出处：

https://github.com/bazingafraser/cv/tree/master/article/rm

站点：https://bazingafraser@github.com/bazingafraser/cv.git

本人博客：http://www.bazingafraser.cn

