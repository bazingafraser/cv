此脚本为搭建VPN服务器脚本\n

注意：请选择国外服务器搭建方可达到翻墙效果\n

具体操作如下：\n
wget --no-check-certificate https://github.com/kalivim/Linux_shell/raw/master/shadowsocks/Linux_shadowsocks.sh
    
chmod +x Linux_shadowsocks.sh
    
./Linux_shadowsocks.sh 2>&1 | tee shadowsocks.log
