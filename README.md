# cloud-lab-scripts
scripts used to setup test apps for azure and aws labs

serve_name_and_ip.sh
---
-add a username/password/node name at the top, run as root. 

-updates ubuntu, installs docker, adds user to sudo and docker groups.

-creates nginx container, pulls and starts site with node name at the top in big ugly text via http

now there is a site to actually test and set up in 2 seconds.

AWS LAUNCH OPTIONS with IP UPDATE:
curl -O https://raw.githubusercontent.com/bbq-bean/cloud-lab-scripts/master/serve_name_and_ip.sh
chmod +x serve_name_and_ip.sh
sudo ./serve_name_and_ip.sh

curl -O https://raw.githubusercontent.com/bbq-bean/cloud-lab-scripts/master/correct_info_cron.sh
chmod +x correct_info_cron.sh
(crontab -l 2>/dev/null; echo "* * * * * /home/ubuntu/correct_info_cron.sh ") | crontab -

setup_docker.sh
---
-given the username and pw at top of the script, setup docker and docker user

