#!/bin/bash

set -e
# hce
sudo yum -y update & yum -y upgrade

# ubuntu
# apt-get -y update
# export DEBIAN_FRONTEND=noninteractive
# apt-get -y -o Dpkg::Options::="--force-confold" dist-upgrade
cd /opt

# 安装jdk
wget https://download.java.net/java/GA/jdk21/fd2272bbf8e04c3dbaee13770090416c/35/GPL/openjdk-21_linux-aarch64_bin.tar.gz
tar -xf openjdk-21_linux-aarch64_bin.tar.gz
echo 'export JAVA_HOME=/opt/jdk-21' | sudo tee -a /etc/profile
echo 'export PATH=$JAVA_HOME/bin:$PATH' | sudo tee -a /etc/profile
source /etc/profile

# 安装git
# hce
dnf -y install git
# ubuntu
# apt -y install git

# 安装maven
wget https://repo.huaweicloud.com/apache/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
tar -xf apache-maven-3.9.6-bin.tar.gz
sudo mv apache-maven-3.9.6 maven
echo 'export MAVEN_HOME=/opt/maven' | sudo tee -a /etc/profile
echo 'export PATH=$MAVEN_HOME/bin:$PATH' | sudo tee -a /etc/profile
source /etc/profile

# 安装shardingproxy
# 安装会慢
wget https://dlcdn.apache.org/shardingsphere/5.5.2/apache-shardingsphere-5.5.2-shardingsphere-proxy-bin.tar.gz
tar -xf apache-shardingsphere-5.5.2-shardingsphere-proxy-bin.tar.gz
mv apache-shardingsphere-5.5.2-shardingsphere-proxy-bin shardingproxy

cat > /opt/shardingproxy/conf/global.yaml << EOF
mode:
  type: Standalone  # 单机模式

authority:
  users:
    - user: root
      password: root
      admin: true
EOF

sudo tee /etc/systemd/system/shardingproxy.service <<-'EOF'
[Unit]
Description=Shardingproxy Server
After=network.target

[Service]
Type=forking
Environment="JAVA_HOME=/opt/jdk-21"
WorkingDirectory=/opt/shardingproxy/bin
ExecStart=/bin/bash start.sh
User=root
Restart=on-failure
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

# 重新加载Systemd
sudo systemctl daemon-reload
# 启用开机启动
sudo systemctl enable shardingproxy
# 重启服务
sudo systemctl start shardingproxy
# 查看状态
sudo systemctl status shardingproxy