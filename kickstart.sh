#!/usr/bin/env bash
## Script must be run as root

# add ssh key
if [ -n "$SSH_KEY" ]; then
  curl -sk "https://ssh.keychain.pw/$SSH_KEY/install" | bash
  echo "==> Added public SSH key"
fi

# set hostname
CUR_HOSTNAME=$(hostname)
printf "Hostname: [$CUR_HOSTNAME]: "
read HOSTNAME
if [ -z $HOSTNAME ]; then
	HOSTNAME=$CUR_HOSTNAME
else
	sudo hostname $HOSTNAME
	echo $HOSTNAME > /etc/hostname
	echo "127.0.0.1    $HOSTNAME" >> /etc/hosts
	echo "==> Hostname set to \"$HOSTNAME\""
fi

# update grup
echo "GRUB_RECORDFAIL_TIMEOUT=2" >> /etc/default/grub
update-grub &>/dev/null
echo "==> Updated Grub"

# add sources for latest stable nginx
wget http://nginx.org/keys/nginx_signing.key &>/dev/null
sudo apt-key add nginx_signing.key &>/dev/null
echo "
deb http://nginx.org/packages/ubuntu/ xenial nginx
deb-src http://nginx.org/packages/ubuntu/ xenial nginx" >> /etc/apt/sources.list

# add sources for node 9.x
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash - &>/dev/null

# update and install packages
sudo apt-get update -y
sudo apt-get install -qq -y avahi-daemon git nodejs make curl software-properties-common man-db python-software-properties openssh-server
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y
sudo apt-get autoclean
sudo apt-get clean
reboot
