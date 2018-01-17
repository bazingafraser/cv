此脚本为搭建VPN服务器脚本

注意：请选择国外服务器搭建方可达到翻墙效果

具体操作如下：

wget --no-check-certificate https://github.com/kalivim/Linux_shell/raw/master/shadowsocks/Linux_shadowsocks.sh
    
chmod +x Linux_shadowsocks.sh
    
./Linux_shadowsocks.sh 2>&1 | tee shadowsocks.log

客户端下载：https://github.com/j-proxy/iossos

该脚本解释权归bazingafraser所有，转载请注明出处：https://github.com/bazingafraser/cv/tree/master/rpm/vpn

本人博客：http://www.bazingafraser.cn
