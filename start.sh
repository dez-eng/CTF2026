#!/bin/bash

echo "[*] 正在启动银河档案馆..."

# 动态 Flag:优先使用平台注入的 FLAG 环境变量;未注入时生成随机 flag(杜绝硬编码默认值泄露)
if [ -z "$FLAG" ]; then
    REAL_FLAG="flag{$(head -c 16 /dev/urandom | md5sum | cut -c1-16)}"
else
    REAL_FLAG="$FLAG"
fi

# 伪 Flag(干扰项)
FAKE_FLAG="flag{Fake_Hala_Madrid_15_Times}"

# 创建隐藏目录(该目录已被 Apache 配置为禁止 HTTP 直连,只能通过命令注入访问)
mkdir -p /var/www/html/.hidden/backup/.data/

# 写入真实 Flag(仅服务器本地可读)
echo "$REAL_FLAG" > /var/www/html/.hidden/backup/.data/flag.txt

# 写入伪 Flag
echo "$FAKE_FLAG" > /var/www/html/fake_flag.txt

# 设置权限
chmod 644 /var/www/html/.hidden/backup/.data/flag.txt
chmod 644 /var/www/html/fake_flag.txt

# 清理环境变量,防止泄露
unset FLAG

echo "[*] Flag 部署完成..."
echo "[*] 启动 Apache..."

sleep 3

apache2-foreground
