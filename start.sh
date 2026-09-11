#!/bin/bash

echo "[*] 正在启动银河档案馆 (GZCTF 单容器模式)..."

# ========== 动态 Flag ==========
# GZCTF 为每支队伍启动独立容器,并按题目的 flag 模板(如 HuSec2026{[GUID]})生成唯一
# GZCTF_FLAG 注入;同时兼容通用 FLAG 环境变量;两者皆无时兜底随机(避免硬编码泄露)。
#
# 注意:GZCTF 在【管理端"测试容器"】以及题目未配置 flag 模板时,注入的是占位值
# flag{GZCTF_dynamic_flag_test}(见 GZCTF Challenge.GenerateTestFlag),它【不是】
# 每队唯一的动态 flag。命中时容器照常使用(保证与平台校验一致),但打印醒目告警。
GZCTF_PLACEHOLDER_FLAG='flag{GZCTF_dynamic_flag_test}'

if [ -n "$GZCTF_FLAG" ]; then
    REAL_FLAG="$GZCTF_FLAG"
    FLAG_SOURCE="GZCTF_FLAG(平台注入)"
elif [ -n "$FLAG" ]; then
    REAL_FLAG="$FLAG"
    FLAG_SOURCE="FLAG(平台注入)"
else
    REAL_FLAG="flag{$(head -c 16 /dev/urandom | md5sum | cut -c1-16)}"
    FLAG_SOURCE="本地兜底随机"
fi

if [ "$REAL_FLAG" = "$GZCTF_PLACEHOLDER_FLAG" ]; then
    echo "==================================================================="
    echo "[!] 检测到 GZCTF 占位 flag: $GZCTF_PLACEHOLDER_FLAG"
    echo "[!] 它来自管理端『测试容器』,或题目未配置 flag 模板时的默认值,"
    echo "[!] 并非比赛期间为每支队伍动态生成的唯一 flag(所有队伍都会一样)。"
    echo "[!] 平台侧请检查:"
    echo "[!]   1. 题目类型为『动态容器』(DynamicContainer);"
    echo "[!]   2. 题目的 flag 模板已填 HuSec2026{[GUID]} 并保存;"
    echo "[!]   3. 用两个不同队伍的选手账号各开一次容器比对(勿用测试容器验证)。"
    echo "==================================================================="
fi

# 伪 Flag(干扰项)
FAKE_FLAG="flag{Fake_Hala_Madrid_15_Times}"

# 写入真实 Flag 到隐藏目录(该目录已被 Apache 禁止 HTTP 直连,只能通过命令注入读取)
# 私有加密层:flag 以密文归档,解密算法见同目录 cipher.php(需选手读取源码逆向)
mkdir -p /var/www/html/.hidden/backup/.data/
ENC_PHP=/var/www/html/.hidden/backup/.data/cipher.php
ENCRYPTED=$(php -r 'require $argv[1]; echo enc_flag($argv[2], $key);' "$ENC_PHP" "$REAL_FLAG" 2>/dev/null)
if [ -n "$ENCRYPTED" ]; then
    # 密文不带换行写入,避免选手用 hex2bin(file_get_contents()) 读取时报"奇数长度"
    printf '%s' "$ENCRYPTED" > /var/www/html/.hidden/backup/.data/flag.txt
else
    echo "[!] 警告: flag 加密失败,已退化为明文写入(请检查 $ENC_PHP / 容器内 php)"
    printf '%s' "$REAL_FLAG" > /var/www/html/.hidden/backup/.data/flag.txt
fi

# 写入伪 Flag
echo "$FAKE_FLAG" > /var/www/html/fake_flag.txt

chmod 644 /var/www/html/.hidden/backup/.data/flag.txt
chmod 644 /var/www/html/fake_flag.txt

echo "[*] flag 来源: $FLAG_SOURCE (长度 ${#REAL_FLAG})"

# 清除环境变量,防止选手通过 /proc/1/environ 或 phpinfo() 读到 flag
unset GZCTF_FLAG FLAG

# ========== 内置 MariaDB(单容器自含数据库) ==========
echo "[*] 初始化内置数据库..."
mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

if [ ! -d /var/lib/mysql/mysql ]; then
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql >/dev/null 2>&1 || true
fi

# 后台启动 MariaDB
mysqld_safe --user=mysql >/dev/null 2>&1 &

# 等待数据库就绪
echo "[*] 等待数据库就绪..."
for i in $(seq 1 60); do
    if mysqladmin ping --silent 2>/dev/null; then
        break
    fi
    sleep 1
done

# 重建题目数据库(无状态数据,每次干净导入)
echo "[*] 导入题目数据库..."
mysql -uroot -e "DROP DATABASE IF EXISTS ctf_db;" 2>/dev/null
mysql -uroot < /var/www/html/db.sql 2>/dev/null

# 创建应用账号并授权
mysql -uroot -e "
CREATE USER IF NOT EXISTS 'ctf_user'@'localhost' IDENTIFIED BY 'ctf_pass_2024';
CREATE USER IF NOT EXISTS 'ctf_user'@'127.0.0.1' IDENTIFIED BY 'ctf_pass_2024';
GRANT ALL PRIVILEGES ON ctf_db.* TO 'ctf_user'@'localhost';
GRANT ALL PRIVILEGES ON ctf_db.* TO 'ctf_user'@'127.0.0.1';
FLUSH PRIVILEGES;" 2>/dev/null

echo "[*] 启动 Apache..."
exec apache2-foreground
