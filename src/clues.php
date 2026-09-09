<?php session_start(); ?>
<!DOCTYPE html>
<html lang="zh-CN">
<head><meta charset="UTF-8"><title>🔍 线索</title>
<style>
*{margin:0;padding:0;box-sizing:border-box;}
body{font-family:"Segoe UI",Arial,sans-serif;background:linear-gradient(135deg,#0a0a0a,#1a1a3e,#0a0a2a);min-height:100vh;color:#fff;padding:20px;}
.container{max-width:900px;margin:0 auto;background:rgba(255,255,255,0.03);backdrop-filter:blur(10px);border-radius:20px;padding:40px;border:1px solid rgba(255,215,0,0.15);}
.header{text-align:center;margin-bottom:40px;}.header h1{font-size:36px;color:#ffd700;}
.nav{display:flex;gap:15px;justify-content:center;margin:30px 0;flex-wrap:wrap;}
.nav a{color:#ccc;text-decoration:none;padding:12px 25px;background:rgba(255,255,255,0.03);border-radius:30px;transition:all 0.3s;border:1px solid rgba(255,255,255,0.05);}
.nav a:hover{background:rgba(255,215,0,0.08);border-color:rgba(255,215,0,0.3);color:#fff;}
.nav a.active{background:rgba(255,215,0,0.15);color:#ffd700;border-color:#ffd700;}
.clue-card{background:rgba(0,0,0,0.3);border-radius:12px;padding:20px;margin:15px 0;border:1px solid rgba(255,255,255,0.03);}
.clue-card .tag{display:inline-block;background:rgba(255,215,0,0.08);padding:2px 12px;border-radius:12px;font-size:11px;color:#888;margin-bottom:8px;}
.clue-card h3{color:#ccc;font-size:16px;margin-bottom:8px;}
.clue-card .content{color:#888;font-size:14px;font-family:monospace;background:rgba(0,0,0,0.2);padding:8px 12px;border-radius:6px;margin:8px 0;}
.clue-card .meaning{color:#666;font-size:13px;margin-top:8px;border-top:1px solid rgba(255,255,255,0.03);padding-top:8px;}
.summary{background:rgba(255,215,0,0.03);border:1px solid rgba(255,215,0,0.1);border-radius:15px;padding:30px;margin:30px 0;text-align:center;}
.summary .answer{font-size:24px;color:#ffd700;font-weight:bold;margin:15px 0;letter-spacing:2px;}
.btn{display:inline-block;padding:12px 35px;background:rgba(255,215,0,0.15);color:#ffd700;text-decoration:none;border-radius:30px;font-weight:bold;transition:all 0.3s;border:1px solid rgba(255,215,0,0.2);}
.btn:hover{background:rgba(255,215,0,0.25);transform:scale(1.03);}
.footer{text-align:center;margin-top:40px;color:#444;font-size:12px;}
</style>
</head>
<body>
<div class="container">
<div class="header"><h1>🔍 线索收集</h1><p style="color:#666;font-size:14px;">把碎片拼在一起</p></div>
<div class="nav">
<a href="index.php">📖 故事</a>
<a href="clues.php" class="active">🔍 线索</a>
<a href="about.php">ℹ️ 守护者</a>
<a href="login.php">🔐 入口</a>
</div>
<div style="text-align:center;color:#555;font-size:13px;margin-bottom:20px;">✦ 已发现 <span style="color:#ffd700;">6</span> 条线索 ✦</div>
<div class="clue-card"><div class="tag">🔎 线索 1</div><h3>⚪ 白衣军团</h3><div class="content">X-Clue: White_Army_15</div><div class="meaning">→ 白色战袍 + 15次登顶</div></div>
<div class="clue-card"><div class="tag">🔎 线索 2</div><h3>📣 战吼</h3><div class="content">&lt;!-- "Hala Madrid" --&gt;</div><div class="meaning">→ 标志性口号</div></div>
<div class="clue-card"><div class="tag">🔎 线索 3</div><h3>🏟️ 圣殿</h3><div class="content">Cookie: hint=QmVybmFiZXU=</div><div class="meaning">→ Base64: Bernabeu</div></div>
<div class="clue-card"><div class="tag">🔎 线索 4</div><h3>🌟 绰号</h3><div class="content">图片: galacticos_15_cups.png</div><div class="meaning">→ "银河战舰"</div></div>
<div class="clue-card"><div class="tag">🔎 线索 5</div><h3>📅 诞生</h3><div class="content">CSS: .founded::after { content: "1902"; }</div><div class="meaning">→ 成立于1902年</div></div>
<div class="clue-card"><div class="tag">🔎 线索 6</div><h3>🏆 荣誉</h3><div class="content">首页数据: 15次欧洲之巅</div><div class="meaning">→ 欧洲之王</div></div>
<div class="summary">
<p style="color:#888;font-size:14px;">所有线索指向同一支球队</p>
<div class="answer">⚪ 皇家马德里 · Real Madrid CF</div>
<p style="color:#666;font-size:13px;">现在，前往入口验证</p>
<br><a href="login.php" class="btn">🔐 进入档案馆</a>
</div>
<div class="footer"><p>⚽ 银河战舰档案馆 · 2024</p></div>
</div>
</body>
</html>
