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

# create dockerfile
cat << EOF >> Dockerfile
FROM nginx:latest
COPY ["index.html", "/usr/share/nginx/html/"]
EOF

# run nginx serving the static file
docker build -t nginx-display-host .
docker run -d -p 8080:80 --name return-http-host --restart=unless-stopped nginx-display-host
