FROM php:8.2-apache

# 安装扩展
RUN docker-php-ext-install mysqli && \
    docker-php-ext-install pdo_mysql

# 启用Apache模块
RUN a2enmod rewrite headers

# 禁止通过 HTTP 直接访问隐藏目录(.hidden 真实 flag、.archive 诱饵,均只能通过命令注入读取)
RUN printf '<Directory /var/www/html/.hidden>\n    Require all denied\n</Directory>\n<Directory /var/www/html/.archive>\n    Require all denied\n</Directory>\n' > /etc/apache2/conf-available/hidden.conf && a2enconf hidden

# 设置工作目录
WORKDIR /var/www/html

# 复制源码
COPY src/ /var/www/html/

# 模拟 .git 泄露线索(git 无法追踪 .git 路径,故在构建时生成)
RUN mkdir -p /var/www/html/.git && printf 'Git repo\n' > /var/www/html/.git/config

# 设置权限
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html && \
    chmod 444 /var/www/html/*.php 2>/dev/null || true && \
    chmod 444 /var/www/html/.htaccess 2>/dev/null || true

# 创建Flag文件占位
RUN touch /var/www/html/real_flag.txt /var/www/html/fake_flag.txt && \
    chmod 666 /var/www/html/real_flag.txt /var/www/html/fake_flag.txt

# 复制启动脚本
COPY start.sh /start.sh
RUN chmod +x /start.sh

# 安装工具与内置数据库(单容器:题目自带 MariaDB,适配 GZCTF 单容器部署)
RUN apt-get update && \
    apt-get install -y --no-install-recommends iputils-ping netcat-openbsd mariadb-server && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 80

CMD ["/start.sh"]
