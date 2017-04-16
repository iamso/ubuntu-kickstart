Ubuntu Kickstart
================

Runs a few commands I like to run on fresh Ubuntu Servers.

Usage
-----

Run this as root:

```bash
sudo -i
SSH_KEY=your@email.tld bash <(curl -sk https://raw.githubusercontent.com/iamso/ubuntu-kickstart/master/kickstart.sh)
```

### Vagrant

```bash
sudo -i
SSH_KEY=your@email.tld bash <(curl -sk https://raw.githubusercontent.com/iamso/ubuntu-kickstart/master/kickstart-vagrant.sh)
```

### Update

```bash
bash <(curl -sk https://raw.githubusercontent.com/iamso/ubuntu-kickstart/master/update.sh)
```
