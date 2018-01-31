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

