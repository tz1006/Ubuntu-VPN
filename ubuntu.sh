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
sudo sed -i 's/^net.ipv4.ip_forward.*/net.ipv4.ip_forward = 1/g' /etc/sysctl.conf
sudo sysctl -p

# ufw
sudo ufw allow 
sudo ufw allow 

# Start
sudo service pptpd start
sudo service strongswan start
sudo ipsec restart
