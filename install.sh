#!/bin/bash

# download minio executable
curl -o minio https://dl.min.io/server/minio/release/linux-amd64/minio
chmod +x ./minio

# create directory to store minio in
mkdir -p /usr/local/bin/minio
cp ./minio /usr/local/bin/minio/minio

# create directory for minio data
mkdir -p /var/minio/data

# copy systemd unit file
cp ./minio.service /usr/lib/systemd/system/

# create minio configuration file
mkdir -p /etc/minio
touch /etc/minio/minio.env

# start and enable minio
systemctl start minio
systemctl enable minio

# install nginx
sudo apt install -y nginx

cp ./nginx.conf /etc/nginx/sites-available/cdn.ros-cloud.apt

ln -s /etc/nginx/sites-available/cdn.ros-cloud.at /etc/nginx/sites-enabled/

sudo systemctl restart nginx
sudo systemctl enable nginx

sudo ufw allow ssh/tcp
sudo ufw allow http/tcp
sudo ufw allow https/tcp
sudo ufw enable

sudo reboot

