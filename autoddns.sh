#!/bin/sh
# wan ifup
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export PATH
[ $ACTION = "ifup" -a $INTERFACE = "wan" ]
sh /root/dnspod/ddnspod.sh >> /tmp/log/dnspod.log 2>&1 &
