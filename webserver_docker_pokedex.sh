#!/bin/bash

username="user1"
userpass="4Y2rtp8kcFww4VD65pmH2BqE"

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

useradd -d /home/$username -m -s /bin/bash $username
echo "$username:$userpass" | chpasswd

usermod -aG sudo "$username"
usermod -aG docker "$username"

echo DONE
