#!/bash/sh
sudo apt-get update -y
sudo apt-get -y install git
# sudo apt-get install -y git sysv-rc-conf

git clone https://github.com/tz1006/Ubuntu-VPN.git

# Install PPTP
#sudo apt-get install -y pptpd
#sudo cp -f ~/Ubuntu-VPN/pptp/pptpd.conf /etc/pptpd.conf
#sudo cp -f ~/Ubuntu-VPN/pptp/options.pptpd /etc/ppp/options.pptpd
#sudo cp -f ~/Ubuntu-VPN/pptp/chap-secrets /etc/ppp/chap-secrets

# Install IPsec
sudo apt-get install -y strongswan strongswan-plugin-xauth-generic
sudo cp -f ~/Ubuntu-VPN/strongswan/ipsec.conf /etc/ipsec.conf
sudo cp -f ~/Ubuntu-VPN/strongswan/ipsec.secrets /etc/ipsec.secrets
sudo cp -f ~/Ubuntu-VPN/strongswan/strongswan.conf /etc/strongswan.conf

# Install sock5
sudo apt-get install -y dante-server
sudo cp -f ~/Ubuntu-VPN/danted/danted.conf /etc/danted.conf

# Sysctl Config
# /sbin/iptables -t nat -A POSTROUTING -s 10.0.0.0/8 -o eth0 -j MASQUERADE
# sudo sysctl -p


# ufw
sudo bash ~/Ubuntu-VPN/ufw.sh
# Start
#sudo service pptpd restart
sudo service strongswan restart
#sudo ipsec restart
sudo service danted restart

# http://www.jianshu.com/p/0588a87feff6
# https://www.darrenfang.com/2014/01/install-pptp-vpn-on-ubuntu/
# http://blog.liuxx.com/centos-6-4%E5%AE%89%E8%A3%85%E6%90%AD%E5%BB%BApptp-vpn%E6%9C%8D%E5%8A%A1/
