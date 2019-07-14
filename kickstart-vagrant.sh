#!/usr/bin/env bash
## Script must be run as root

# add ssh key
if [ -n "$SSH_KEY" ]; then
  curl -sk "https://ssh.keychain.pw/$SSH_KEY/install" | bash
  echo "==> Added public SSH key"
fi

# add sources for latest stable nginx
wget http://nginx.org/keys/nginx_signing.key &>/dev/null
sudo apt-key add nginx_signing.key &>/dev/null
echo "
deb http://nginx.org/packages/ubuntu/ xenial nginx
deb-src http://nginx.org/packages/ubuntu/ xenial nginx" >> /etc/apt/sources.list

# add sources for node 12.x
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - &>/dev/null

# update and install packages
sudo apt-get update -y
sudo apt-get install -qq -y avahi-daemon git nodejs make curl software-properties-common man-db python-software-properties openssh-server
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y
sudo apt-get autoclean
sudo apt-get clean
reboot
