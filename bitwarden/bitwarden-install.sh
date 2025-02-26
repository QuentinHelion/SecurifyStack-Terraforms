mkdir /opt/bitwarden
printf 'bitwarden\nbitwarden\n\n\n\n\n\n\n' | adduser bitwarden
chmod -R 700 /opt/bitwarden
chown -R bitwarden:bitwarden /opt/bitwarden
usermod -aG docker bitwarden
apt install curl -y
printf 'bitwarden\n' | su - bitwarden
curl -Lso bitwarden.sh "https://func.bitwarden.com/api/dl/?app=self-host&platform=linux" && chmod 700 bitwarden.sh
printf 'y\n192.170.10.200\nn\nvault\n' | ./bitwarden.sh install --agree-to-terms --email email@example.com
printf 'y\n' | ./bitwarden.sh start
