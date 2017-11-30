本目录为搭建源码php环境所用源码tar包



PHP7 安装

1、编译安装php\
[root@10-6-22-7 package]# tar -zxvf php-7.0.6.tar.gz\
[root@10-6-22-7 php-7.0.6]# cd php-7.0.6\
[root@10-6-22-7 php-7.0.6]# ./configure \
--prefix=/usr/local/php7 \
--with-curl \
--with-freetype-dir \
--with-gd \
--with-config-file-path=/usr/local/php7/etc \
--with-mysqli=/usr/local/mysql/bin/mysql_config \
--with-iconv=/usr/local \
--with-jpeg-dir \
--with-png-dir \
--with-zlib \
--with-libxml-dir=/usr \
--enable-xml \
--disable-rpath \
--enable-bcmath \
--enable-shmop \
--enable-sysvsem \
--enable-inline-optimization \
--enable-mbregex \
--enable-fpm \
--enable-mbstring \
--with-mcrypt \
--enable-gd-native-ttf \
--with-openssl \
--with-mhash \
--enable-pcntl \
--enable-sockets \
--with-ldap \
--with-ldap-sasl \
--with-xmlrpc \
--enable-zip \
--enable-soap \
--without-pear \
--enable-maintainer-zts \
--enable-opcache \
--with-curl\
[root@10-6-22-7 php-7.0.6]# make ZEND_EXTRA_LIBS='-liconv'\
[root@10-6-22-7 php-7.0.6]# make install

2、创建php配置文件\
[root@10-6-22-7 php-7.0.6]# cp -f php.ini-production /usr/local/php7/etc/php.ini

3、编辑php-fpm配置文件\
[root@10-6-22-7 etc]# vi /usr/local/php7/etc/php-fpm.conf\
写入内容：\
[global]\
pid = /usr/local/php7/php-fpm.pid\
error_log = /data/weblogs/php-fpm-error.log\
log_level = notice\
emergency_restart_threshold = 10\
emergency_restart_interval = 1m\
process_control_timeout = 5s\
daemonize = yes\
[www]\
listen = 127.0.0.1:9000\
listen.backlog = -1\
listen.allowed_clients = 127.0.0.1\
user = www\
group = www\
listen.mode=0666\
pm = dynamic\
pm.max_children = 64\
pm.start_servers = 5\
pm.min_spare_servers = 5\
pm.max_spare_servers = 15\
pm.max_requests = 1024\
request_terminate_timeout = 0s\
request_slowlog_timeout = 0s\
slowlog = /data/weblogs/php-fpm-slow.log\
rlimit_files = 65535\
rlimit_core = 0\
chroot =\
chdir =\
catch_workers_output = yes\
env[HOSTNAME] = 10-6-22-7\
env[PATH] = /usr/local/bin:/usr/bin:/bin\
env[TMP] = /tmp\
env[TMPDIR] = /tmp\
env[TEMP] = /tmp\
php_flag[display_errors] = off

2、编译phpredis 模块\
[root@10-6-22-7 package]# wget https://github.com/phpredis/phpredis/archive/php7.zip\
[root@10-6-22-7 package]# unzip php7.zip\
[root@10-6-22-7 package]# cd phpredis-php7\
[root@10-6-22-7 phpredis-php7]# /usr/local/php7/bin/phpize\
[root@10-6-22-7 phpredis-php7]# ./configure --with-php-config=/usr/local/php7/bin/php-config\
[root@10-6-22-7 phpredis-php7]# make && make install\
[root@10-6-22-7 phpredis-php7]# vi /usr/local/php7/etc/php.ini\
在扩展中增加一行\
extension=redis.so


Swoole 升级\
[root@10-6-22-7 package]# wget 'https://github.com/swoole/swoole-src/archive/swoole-1.8.5-stable.tar.gz'\
[root@10-6-22-7 package]# tar -zxvf ./swoole-1.8.5-stable.tar.gz\
[root@10-6-22-7 package]# cd swoole-src-swoole-1.8.5-stable\
[root@10-6-22-7 swoole-src-swoole-1.8.5-stable]# /usr/local/php7/bin/phpize\
[root@10-6-22-7 swoole-src-swoole-1.8.5-stable]# ./configure --with-php-config=/usr/local/php7/bin/php-config\
[root@10-6-22-7 swoole-src-swoole-1.8.5-stable]# make\
[root@10-6-22-7 swoole-src-swoole-1.8.5-stable]# make install\
[root@10-6-22-7 swoole-src-swoole-1.8.5-stable]# vi /usr/local/php7/etc/php.ini\
输入：extension=swoole.so\
保存退出即可\
[root@10-6-22-7 swoole-src-swoole-1.8.5-stable]# /usr/local/php7/bin/php -m | grep 'swoole'\
运行上面的命令  检查是否成功加载swoole.so



该脚本解释权归bazingafraser所有，转载请注明出处：https://github.com/bazingafraser/cv/tree/master/rpm/SC

本人博客：http://www.bazingafraser.cn
