此脚本为搭建VPN服务器脚本\
注意：请选择国外服务器搭建方可达到翻墙效果

一：具体操作如下：\
提示：由于手机端的连接方式和电脑端有些许不同，所以推荐使用第二种搭建方式：\
搭建方式一:\
linux服务器端搭建：\
chmod +x Linux_shadowsocks.sh\
./Linux_shadowsocks.sh 2>&1 | tee shadowsocks.log

搭建方式二:\
chmod +x shadowsocks-go.sh
./shadowsocks-go.sh

客户端下载：\
全部客户端下载路径：\
http://help.fyvps.com/index.php/archives/51/

安卓客户端：\
https://raw.githubusercontent.com/bazingafraser/cv/master/rpm/vpn/shadowsocks-android.apk

IOS、ipad客户端：\
https://github.com/j-proxy/iossos

windows客户端：\
https://raw.githubusercontent.com/bazingafraser/cv/master/rpm/vpn/Shadowsocks.exe

mac客户端：\
https://raw.githubusercontent.com/bazingafraser/cv/master/rpm/vpn/ShadowsocksX-NG.zip

二、使用ss搭建的vpn使用的时候网速有些慢，下面是在ss搭建的基础上进行加速的操作\
FinalSpeed只是作为加速软件出现，本身不具备翻越功能，因此必须配合SS等一起使用\
1、服务端搭建方式:\
下载一键部署脚本按照提示进行操作即可：\
chmod +x install_finalspeedy.sh\
./install_finalspeedy.sh\
2、fs加速客户端下载:\
windows客户端：\
https://raw.githubusercontent.com/bazingafraser/cv/master/rpm/vpn/finalspeed-win.exe

mac客户端：\
https://raw.githubusercontent.com/bazingafraser/cv/master/rpm/vpn/finalspeed-mac.zip

使用方法说明：\
1、服务器端安装完成finalspeedy之后进行以下操作\
2、配置ss客户端的服务器ip为：127.0.0.1\
3、配置ss客户端的服务器端口为本地电脑的任意端口这里我使用的是9090\
4、配置ss加密方式为搭建ss服务器时使用的加密方式，我这里使用的是aes-256-cfb\
5、配置ss客户端密码为搭建ss服务器时的密码\
6、配置fs客户端服务器地址为搭建ss服务器的公网ip\
7、配置fs客户端传输协议为UDP，带宽自行设置\
8、添加加速列表：\
加速端口为搭建ss服务器时使用的端口，我这里使用的是8989\
本地端口和我们上面在ss客户端使用的本地端口需要一致为9090\
9、配置完成之后点击fs客户端的显示日志查看是否连接成功，也可以使用浏览器访问谷歌是否可以使用

注意：该脚本解释权归bazingafraser所有，转载请注明出处：https://github.com/bazingafraser/cv/tree/master/rpm/vpn

站点：https://bazingafraser@github.com/bazingafraser/cv.git

本人博客：http://www.bazingafraser.cn
