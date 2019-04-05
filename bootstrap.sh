#!/usr/bin/env bash

# Add the code to Vagrantfile
# config.vm.provision :shell, path: "bootstrap.sh"

echo "--------------------------"
echo " Upgdate & Upgrade System "
echo "--------------------------"

# change source mirror
mv /etc/apt/sources.list /etc/apt/sources.list.bak
cp /vagrant/sources.list /etc/apt/

apt-get update -y
apt-get upgrade -y


echo "---------------"
echo " Install NGINX "
echo "---------------"
apt install -y nginx


echo "-----------------"
echo " Install MariaDB "
echo "-----------------"
apt install -y mariadb-server php-mysql

# mysql -u root
# \q
# mysql_secure_installation
# Y for all


echo "-------------"
echo " Install PHP "
echo "-------------"
apt install -y php-fpm


echo "-----------------"
echo " Initialize Site "
echo "-----------------"
cp /vagrant/nginx/*.conf   /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/*.conf   /etc/nginx/sites-enabled/

nginx -s reload
nginx -t
