<?php session_start(); ?>
<!DOCTYPE html>
<html lang="zh-CN">
<head><meta charset="UTF-8"><title>ℹ️ 守护者</title>
<style>
*{margin:0;padding:0;box-sizing:border-box;}
body{font-family:"Segoe UI",Arial,sans-serif;background:linear-gradient(135deg,#0a0a0a,#1a1a3e,#0a0a2a);min-height:100vh;color:#fff;padding:20px;}
.container{max-width:900px;margin:0 auto;background:rgba(255,255,255,0.03);backdrop-filter:blur(10px);border-radius:20px;padding:40px;border:1px solid rgba(255,215,0,0.15);}
.header{text-align:center;margin-bottom:40px;}.header h1{font-size:36px;color:#ffd700;}
.nav{display:flex;gap:15px;justify-content:center;margin:30px 0;flex-wrap:wrap;}
.nav a{color:#ccc;text-decoration:none;padding:12px 25px;background:rgba(255,255,255,0.03);border-radius:30px;transition:all 0.3s;border:1px solid rgba(255,255,255,0.05);}
.nav a:hover{background:rgba(255,215,0,0.08);border-color:rgba(255,215,0,0.3);color:#fff;}
.nav a.active{background:rgba(255,215,0,0.15);color:#ffd700;border-color:#ffd700;}
.footer{text-align:center;margin-top:40px;color:#444;font-size:12px;}
</style>
</head>
<body>
<div class="container">
<div class="header"><h1>ℹ️ 关于守护者</h1></div>
<div class="nav">
<a href="index.php">📖 故事</a>
<a href="clues.php">🔍 线索</a>
<a href="about.php" class="active">ℹ️ 守护者</a>
<a href="login.php">🔐 入口</a>
</div>
<div style="background:rgba(0,0,0,0.3);border-radius:15px;padding:30px;margin:20px 0;">
<h2 style="color:#ffd700;">👤 银河守护者</h2>
<p style="color:#bbb;line-height:1.8;">
我守护着一支身穿<span style="color:#ffd700;">纯白战袍</span>的球队，
他们在<span style="color:#ffd700;">伯纳乌</span>书写传奇，
<strong style="color:#ffd700;">15次</strong>登上欧洲之巅。
</p>
<p style="text-align:center;font-size:24px;color:#ffd700;margin-top:20px;letter-spacing:3px;">
"¡Hala Madrid!"
</p>
</div>
<div style="text-align:center;padding:20px;background:rgba(0,0,0,0.2);border-radius:10px;margin:20px 0;">
<p style="color:#666;font-size:12px;">📁 galacticos_15_cups.png</p>
</div>
<div class="footer"><p>⚽ 银河战舰档案馆 · 2024</p></div>
</div>
</body>
</html>
