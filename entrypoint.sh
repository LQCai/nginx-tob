#!/bin/sh

if [ -f "/home/ssh/key" ]; then
  eval `ssh-agent -s`
  chmod 700 /home/ssh/key
  ssh-add /home/ssh/key
  echo "IdentityFile /home/ssh/key" >> /etc/ssh/ssh_config
  # 为了添加ssh密钥到konwn_hosts执行 ssh语句
  ssh -o "StrictHostKeyChecking no" "gitlab.com"
fi

if [ -f "/usr/share/nginx/html/pull.sh" ]; then
  chmod +x /usr/share/nginx/html/pull.sh
  sh /usr/share/nginx/html/pull.sh
fi

nginx -g 'daemon off;'
