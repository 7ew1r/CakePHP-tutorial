sudo yum update -y
sudo yum install -y httpd git unzip

# add EPEL repository
sudo yum install -y epel-release
# add Remi repository
sudo rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

# install PHP and package
sudo yum install -y --enablerepo=remi,remi-php70 php php-mbstring php-intl php-pdo php-mysql php-xml

# install MariaDB

cat <<EOF | sudo tee /etc/yum.repos.d/MariaDB.repo
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.1/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
EOF

sudo yum install -y MariaDB-server MairaDB-client

# start mariaDB
sudo systemctl start mysqld

# setup Database
mysql -u root < /home/vagrant/cms/scripts/db_init.sql

# 
cd cms
curl -s https://getcomposer.org/installer | php
php composer.phar install
