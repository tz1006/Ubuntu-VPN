#! /bin/bash
sudo apt-get update -y

sudo apt-get install -y ufw
# sudo apt-get install gufw

# sudo sed -i 's/^net\/ipv4\/conf\/all\/accept_redirects.*/net\/ipv4\/conf\/all\/accept_redirects=1/g' /etc/ufw/sysctl.conf
sudo sed -i 's/^IPV6.*/IPV6=no/g' /etc/default/ufw
sudo sed -i 's/^IPT_SYSCTL.*/IPT_SYSCTL=\/etc\/sysctl.conf/g' /etc/default/ufw
# sudo sed -i 's/^net.ipv4.ip_forward.*/net.ipv4.ip_forward = 1/g' /etc/sysctl.conf

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw default allow forward

sudo ufw allow 22
sudo ufw allow 53
sudo ufw allow 80
sudo ufw allow 443

sudo ufw logging on
sudo ufw disable && sudo ufw --force enable
# sudo ufw reset
# https://www.polarxiong.com/archives/ubuntu-ufw-vpn-can-not-connect-internet.html
# https://www.peterdavehello.org/2016/01/ubuntu-based-gnulinux-firewall-ufw-essential-config/
# https://www.digitalocean.com/community/tutorials/how-to-setup-a-firewall-with-ufw-on-an-ubuntu-and-debian-cloud-server
