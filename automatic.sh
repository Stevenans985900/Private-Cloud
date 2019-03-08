#!/bin/bash
echo "[+] set hostname .."
hostnamectl set-hostname ser.tpd-tech.com;
systemctl restart systemd-hostnamed;
echo "[+] Disable any fuction .."
echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/default/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/eth0/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/lo/rp_filter
echo 1 > /proc/sys/net/ipv4/tcp_syncookies
echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo "0" > /proc/sys/net/ipv4/icmp_echo_ignore_all
echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects
echo 0 > /proc/sys/net/ipv4/conf/all/send_redirects
echo 0 > /proc/sys/net/ipv4/conf/default/accept_redirects
echo 0 > /proc/sys/net/ipv4/conf/default/send_redirects
echo 0 > /proc/sys/net/ipv4/conf/eth0/accept_redirects
echo 0 > /proc/sys/net/ipv4/conf/eth2/send_redirects
echo 0 > /proc/sys/net/ipv4/conf/lo/accept_redirects
echo 0 > /proc/sys/net/ipv4/conf/lo/send_redirects
echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
echo 0 > /proc/sys/net/ipv4/conf/default/accept_source_route
echo 0 > /proc/sys/net/ipv4/conf/eth0/accept_source_route
echo 0 > /proc/sys/net/ipv4/conf/lo/accept_source_route
echo 0 > /proc/sys/net/ipv4/conf/all/mc_forwarding
echo 0 > /proc/sys/net/ipv4/conf/default/mc_forwarding
echo 0 > /proc/sys/net/ipv4/conf/eth0/mc_forwarding
echo 0 > /proc/sys/net/ipv4/conf/lo/mc_forwarding
echo 0 > /proc/sys/net/ipv4/conf/default/proxy_arp
echo 0 > /proc/sys/net/ipv4/conf/all/proxy_arp
echo 0 > /proc/sys/net/ipv4/conf/eth0/proxy_arp
echo 0 > /proc/sys/net/ipv4/conf/lo/proxy_arp
echo 0 > /proc/sys/net/ipv4/conf/default/bootp_relay
echo 0 > /proc/sys/net/ipv4/conf/all/bootp_relay
echo 0 > /proc/sys/net/ipv4/conf/eth0/bootp_relay
echo 0 > /proc/sys/net/ipv4/conf/lo/bootp_relay
echo 1 > /proc/sys/net/ipv4/conf/default/log_martians
echo 1 > /proc/sys/net/ipv4/conf/all/log_martians
echo 1 > /proc/sys/net/ipv4/conf/eth0/log_martians
echo 1 > /proc/sys/net/ipv4/conf/lo/log_martians
echo "0" > /proc/sys/net/ipv4/ip_forward
echo 1 > /proc/sys/net/ipv4/conf/default/secure_redirects
echo 1 > /proc/sys/net/ipv4/conf/all/secure_redirects
echo 1 > /proc/sys/net/ipv4/conf/eth2/secure_redirects
echo 1 > /proc/sys/net/ipv4/conf/lo/secure_redirects
echo 0 > /proc/sys/net/ipv4/tcp_timestamps
echo 0 > /proc/sys/net/ipv4/tcp_sack
echo 0 > /proc/sys/net/ipv4/tcp_dsack
echo 0 > /proc/sys/net/ipv4/tcp_fack
echo 0 > /proc/sys/net/ipv4/tcp_window_scaling
echo 30 > /proc/sys/net/ipv4/tcp_keepalive_time
echo 10 > /proc/sys/net/ipv4/tcp_fin_timeout
echo 3 > /proc/sys/net/ipv4/tcp_retries1
echo 65534 > /proc/sys/fs/file-max
echo 1 > /proc/sys/net/ipv4/tcp_tw_recycle
echo 2 > /proc/sys/net/ipv4/tcp_orphan_retries
echo "[+] Disable selinux..."
sed -i 's/SELINUX=/#SELINUX=/g' /etc/selinux/config;
echo SELINUX=disabled >> /etc/selinux/config;
echo "[+] Install more lib..."
yum install wget gcc gcc-c++ flex bison make bind bind-libs bind-utils openssl openssl-devel perl quota libaio libcom_err-devel libcurl-devel gd zlib-devel zip unzip libcap-devel cronie bzip2 cyrus-sasl-devel perl-ExtUtils-Embed autoconf automake libtool which patch mailx bzip2-devel lsof psmisc net-tools systemd-devel libdb-devel perl-DBI xfsprogs rsyslog logrotate crontabs -y;
echo "[+] Install more Software..."
yum install -y mlocate wget git graphviz make autoconf automake jemalloc-devel libedit-devel libtool ncurses-devel pcre-devel pkgconfig python-docutils python-sphinx;
echo "[+] Install epel..."
sudo yum install epel-release;
cd /tmp;
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm;
echo "[+] clear yum cache..."
yum clean all;
yum update -y;
echo "[+] Install more varnish..."
curl -s https://packagecloud.io/install/repositories/varnishcache/varnish61/script.rpm.sh | sudo bash;
echo "[+] clear install varnish..."
yum install varnish -y;
echo "[+] Install docker software..."
yum install -y yum-utils device-mapper-persistent-data lvm2;
echo "[+] Install docker software..."
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo;
yum install docker-ce -y;
echo "[+] Install check update..."
sudo yum check-update;
echo "[+] Install check update and install git discourse..."
mkdir -p /var/discourse;
git clone https://github.com/discourse/discourse_docker.git /var/discourse;
exit;













