<?php
// GZCTF 单容器模式:数据库为镜像内置 MariaDB,连接本机 127.0.0.1
$conn = new mysqli('127.0.0.1', 'ctf_user', 'ctf_pass_2024', 'ctf_db');
if ($conn->connect_error) {
    die('系统维护中');
}
?>