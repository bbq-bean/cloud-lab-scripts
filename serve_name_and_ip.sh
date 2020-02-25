#!/bin/bash

apt-get update -y && \
    apt-get upgrade -y
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io

# create html file

hostname=`hostname`
ip_addr=`hostname --all-ip-addresses`

cat << EOF >> index.html
<!DOCTYPE html>
<html>
  <header>
    <h1>hello!</h1>
    <h3>page served from $hostname</h3>
    <h3>$ip_addr</h3>
  </header>
</html>
EOF

# run nginx serving the static file
docker create --name some-nginx -p 8080:80 nginx
docker cp index.html some-nginx:/usr/share/nginx/html/
docker start some-nginx
