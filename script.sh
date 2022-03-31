add-apt-repository -y ppa:transmissionbt/ppa
apt-get -y update
apt-get -y install transmission-cli transmission-common transmission-daemon apache2
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null &&
              echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list &&
              sudo apt update && sudo apt install ngrok   
              
nano /etc/apache2/apache2.conf
# add to the bottom of file "ServerName" then the droplet IP address
# e.g. ServerName 8.8.8.8

apache2ctl configtest
systemctl restart apache2

# Updated the firewall with the two below. not actually sure if this is necessary but it was in my notes from a different server setup so I left it in here, just in case it is actually needed
ufw app list
ufw allow in "Apache Full"

service transmission-daemon stop
nano /etc/transmission-daemon/settings.json
set rpc-authentication-required as false
set rpc-whitelist-enabled as false
change download-dir to /var/www/html
service transmission-daemon start

chmod 777 /var/www/html/
rm /var/www/html/index.html
