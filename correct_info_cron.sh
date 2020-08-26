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

sudo docker cp index.html return-http-host:/usr/share/nginx/html/
# start with-
# (crontab -l 2>/dev/null; echo "* * * * * /home/ubuntu/correct_info_cron.sh ") | crontab -
