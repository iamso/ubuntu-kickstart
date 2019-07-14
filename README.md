Ubuntu Kickstart
================

Runs a few commands I like to run on fresh Ubuntu Servers.

Usage
-----

### Install

Run this as root.

Ubuntu 16.04:

```bash
sudo -i
SSH_KEY=your@email.tld bash <(curl -sk https://raw.githubusercontent.com/iamso/ubuntu-kickstart/master/kickstart.sh)
```

Ubuntu 18.04:

```bash
sudo -i
SSH_KEY=your@email.tld bash <(curl -sk https://raw.githubusercontent.com/iamso/ubuntu-kickstart/master/kickstart-18.04.sh)
```

### Vagrant

Ubuntu 16.04:

```bash
sudo -i
SSH_KEY=your@email.tld bash <(curl -sk https://raw.githubusercontent.com/iamso/ubuntu-kickstart/master/kickstart-vagrant.sh)
```

Ubuntu 18.04:

```bash
sudo -i
SSH_KEY=your@email.tld bash <(curl -sk https://raw.githubusercontent.com/iamso/ubuntu-kickstart/master/kickstart-vagrant-18.04.sh)
```

### Update

```bash
bash <(curl -sk https://raw.githubusercontent.com/iamso/ubuntu-kickstart/master/update.sh)
```
