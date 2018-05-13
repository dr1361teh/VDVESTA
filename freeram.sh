#!/bin/bash
# echo '*/2 * * * * root bash /root/freeram.sh' >> /etc/crontab
service vesta status &> /dev/null || service vesta start
freemem=$(free -m | awk '/Mem:/{print $4}')
(( freemem <= 100 )) && service httpd reload
