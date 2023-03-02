#!/bin/bash
if [ -f /etc/redhat-release ]; then
  echo "Running on Red Hat"
  sudo yum install wget httpd unzip -y > /dev/null
  sudo systemctl start httpd
  sudo systemctl enable httpd
  mkdir -p /tmp/webfile
  cd /tmp/webfile
  wget https://www.tooplate.com/zip-templates/2102_constructive.zip &> /dev/null
  unzip 2102_constructive.zip > /dev/null
  sudo cp -r 2102_constructive/* /var/www/html/
  sudo systemctl restart httpd
  ls /var/www/html/
  sudo systemctl status httpd
  rm -rf /tmp/webfile
else
  echo "Running on Linux"
  sudo apt-get install wget apache2 unzip -y > /dev/null
  sudo systemctl start apache2
  sudo systemctl enable apache2
  mkdir -p /tmp/webfile
  cd /tmp/webfile
  wget https://www.tooplate.com/zip-templates/2132_clean_work.zip &> /dev/null
  unzip 2132_clean_work.zip > /dev/null
 sudo cp -r 2132_clean_work/* /var/www/html/
sudo systemctl restart apache2
ls /var/www/html/
sudo systemctl status apache2
  rm -rf /tmp/webfile
fi

