<?php
session_start();
header("X-Hint: V2hpdGUgQXJteSAxNQ==");
setcookie('hint', base64_encode('1902'), time() + 3600, '/');
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>银河档案馆</title>
    <style>
        body{font-family:Arial;background:#0a0a0a;color:#ccc;text-align:center;padding:50px}
        h1{color:#ffd700}
        a{color:#ffd700}
        .box{max-width:500px;margin:0 auto;background:rgba(255,255,255,0.03);padding:30px;border-radius:10px}
        hr{border-color:#333}
    </style>
</head>
<body>
    <div class="box">
        <h1>⚽ 银河档案馆</h1>
        <p>寻找失落的传奇...</p>
        <hr>
        <p>你，是真正的追随者吗？</p>
        <br>
        <p><a href="login.php">🔐 进入档案馆</a></p>
        <hr>
        <p style="color:#444;font-size:12px;">银河档案馆 · 2024</p>
    </div>
    <!-- 0x48 0x61 0x6c 0x61 0x20 0x4d 0x61 0x64 0x72 0x69 0x64 -->
</body>
</html>