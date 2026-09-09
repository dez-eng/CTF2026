<?php
$conn = new mysqli('db', 'ctf_user', 'ctf_pass_2024', 'ctf_db');
if ($conn->connect_error) {
    die('系统维护中');
}
?>