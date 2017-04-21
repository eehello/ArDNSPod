# ArDNSPod

基于DNSPod用户API实现的纯Shell动态域名客户端，适配网卡地址。

# Usage

复制`dns.conf.example`到同一目录下的`dns.conf`并根据你的配置修改即可。

执行时直接运行`ddnspod.sh`，支持cron任务。

配置文件格式：
```
# 安全起见，不推荐使用密码认证
# arMail="test@gmail.com"
# arPass="123"

# 推荐使用Token认证
# 按`TokenID,Token`格式填写
arToken="12345,7676f344eaeaea9074c123451234512d"

# 每行一个域名
arDdnsCheck "test.org" "subdomain"
```
'''''''''''''''''''''''''''''''''''''''''''''''
http://www.right.com.cn/forum/thread-205883-1-1.html

在DNSpod添加要更新域名的A记录。

下载https://github.com/anrip/ArDNSPod脚本，放到路由上任意目录，本例为/root/dnspod。
修改dns.conf的Token认证为你自己的，添加要更新的域名。
# 安全起见，不推荐使用密码认证
# arMail="test@gmail.com"
# arPass="123"

# 推荐使用Token认证
# 按`TokenID,Token`格式填写
arToken="12345,7676f344eaeaea9074c123451234512d"

# 每行一个域名
arDdnsCheck "test.com" "www"
复制代码
执行一下命令（注意：脚本需要完整的wget，如没有须先opkg install wget）
sh /root/dnspod/ddnspod.sh
复制代码
然后在DNSpod网站看下IP有没有更新，如更新正常，继续。。。


在/etc/ppp/ip-up.d目录新建一个文件autoddns.sh，权限0755，内容如下：

#/bin/sh

sh /root/dnspod/ddnspod.sh >> /tmp/log/dnspod.log 2>&1 &
复制代码
只要wan口发生变化，就会执行脚本去DNSpod更新A记录的IP。

简单测试一下：/etc/init.d/network restart

'''''''''''''''''''''''''''''''''''''''''''''''


# 最近更新


2015/2/24
- 增加token鉴权方式 (by wbchn)

2015/7/7
- 使用D+服务获取域名解析

2016/2/25
- 增加配置文件，分离脚本与配置，适配内网。
- 加入Mac支持
- sed脚本POSIX化，可跨平台

2016/3/23
- 进一步POSIX化，支持Mac和大部分Linux发行
