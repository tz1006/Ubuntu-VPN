#!/bash/sh
sudo apt-get update -y
# sudo apt-get install -y git sysv-rc-conf

git clone https://github.com/tz1006/PPTP-IPsec.git

# Install PPTP
sudo apt-get install -y pptpd
sudo cp -f ~/PPTP-IPsec/options.pptpd /etc/ppp/options.pptpd
sudo cp -f ~/PPTP-IPsec/chap-secrets /etc/ppp/chap-secrets
sudo cp -f ~/PPTP-IPsec/pptpd.conf /etc/pptpd.conf

# Install IPsec
sudp apt-get install -y strongswan strongswan-plugin-xauth-generic
sudo cp -f ~/PPTP-IPsec/ipsec.conf /etc/strongswan/ipsec.conf
sudo cp -f ~/PPTP-IPsec/ipsec.secrets /etc/strongswan/ipsec.secrets
sudo cp -f ~/PPTP-IPsec/strongswan.conf /etc/strongswan/strongswan.conf

# Sysctl Config
# /sbin/iptables -t nat -A POSTROUTING -s 10.0.0.0/8 -o eth0 -j MASQUERADE
# sudo sysctl -p


# ufw

# Start
sudo service pptpd restart

sudo service strongswan restart
sudo ipsec restart

# http://www.jianshu.com/p/0588a87feff6
# https://www.darrenfang.com/2014/01/install-pptp-vpn-on-ubuntu/
# http://blog.liuxx.com/centos-6-4%E5%AE%89%E8%A3%85%E6%90%AD%E5%BB%BApptp-vpn%E6%9C%8D%E5%8A%A1/
