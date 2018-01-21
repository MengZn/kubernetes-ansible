#!/bin/bash
REAL_IP="1.1.1.30 1.1.1.31 1.1.1.32"
for j in $REAL_IP
do
cat << EOF >> /Users/meng/Desktop/kubernetes-ansible/dockerfile/keepalive/config/keepalived.conf
  real_server $j {
    TCP_CHECK {
      connect_timeout 3
    }
  }
EOF
echo "}" >> /Users/meng/Desktop/kubernetes-ansible/dockerfile/keepalive/config/keepalived.conf
done

# /usr/sbin/keepalived -P -C -d -D -S 7 -f /etc/keepalived/keepalived.conf --dont-fork --log-console