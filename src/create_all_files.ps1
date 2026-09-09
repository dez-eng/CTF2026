# 切换到src目录
cd C:\ctf-projects\web-football-ctf\src

# 创建 about.php
@"
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
"@ | Out-File -FilePath about.php -Encoding utf8

# 创建 clues.php
@"
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
"@ | Out-File -FilePath clues.php -Encoding utf8

# 创建 login.php
@"
<?php
session_start();
include 'config.php';
$error = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['team_name'])) {
    $input = $_POST['team_name'];
    $sql = "SELECT * FROM teams WHERE name = '$input'";
    $result = $conn->query($sql);
    if ($result && $result->num_rows > 0) {
        $team = $result->fetch_assoc();
        if (strtolower($team['name']) === 'real madrid' || strtolower($team['name']) === 'realmadrid') {
            $_SESSION['authenticated'] = true;
            $_SESSION['team'] = $team['name'];
            $patterns = ['OR', 'AND', '--', '#', '1=1', 'UNION', 'SELECT'];
            foreach ($patterns as $p) {
                if (stripos($input, $p) !== false) {
                    $_SESSION['fake_flag_given'] = true;
                    break;
                }
            }
            header('Location: admin.php');
            exit;
        } else {
            $error = '❌ 这不是答案，再想想...';
        }
    } else {
        $error = '❌ 未找到该球队';
    }
}
?>
<!DOCTYPE html>
<html lang="zh-CN">
<head><meta charset="UTF-8"><title>🔐 入口</title>
<style>
*{margin:0;padding:0;box-sizing:border-box;}
body{font-family:"Segoe UI",Arial,sans-serif;background:linear-gradient(135deg,#0a0a0a,#1a1a3e,#0a0a2a);min-height:100vh;color:#fff;padding:20px;}
.container{max-width:900px;margin:0 auto;background:rgba(255,255,255,0.03);backdrop-filter:blur(10px);border-radius:20px;padding:40px;border:1px solid rgba(255,215,0,0.15);}
.header{text-align:center;margin-bottom:40px;}.header h1{font-size:36px;color:#ffd700;}
.nav{display:flex;gap:15px;justify-content:center;margin:30px 0;flex-wrap:wrap;}
.nav a{color:#ccc;text-decoration:none;padding:12px 25px;background:rgba(255,255,255,0.03);border-radius:30px;transition:all 0.3s;border:1px solid rgba(255,255,255,0.05);}
.nav a:hover{background:rgba(255,215,0,0.08);border-color:rgba(255,215,0,0.3);color:#fff;}
.nav a.active{background:rgba(255,215,0,0.15);color:#ffd700;border-color:#ffd700;}
.login-box{background:rgba(0,0,0,0.3);border-radius:15px;padding:30px;max-width:500px;margin:20px auto;}
.login-box h2{color:#ffd700;text-align:center;margin-bottom:20px;font-size:20px;}
.login-box label{display:block;margin:15px 0 5px 0;color:#888;font-size:14px;}
.login-box input{width:100%;padding:12px;background:rgba(255,255,255,0.05);border:1px solid rgba(255,255,255,0.1);border-radius:8px;color:#fff;font-size:16px;box-sizing:border-box;}
.login-box input:focus{outline:none;border-color:rgba(255,215,0,0.3);}
.login-box button{width:100%;padding:14px;margin-top:20px;background:rgba(255,215,0,0.15);color:#ffd700;border:1px solid rgba(255,215,0,0.2);border-radius:8px;font-size:18px;font-weight:bold;cursor:pointer;transition:all 0.3s;}
.login-box button:hover{background:rgba(255,215,0,0.25);}
.error{background:rgba(255,0,0,0.08);border:1px solid rgba(255,0,0,0.15);border-radius:8px;padding:12px;margin:15px 0;color:#ff6b6b;text-align:center;font-size:14px;}
.hint{background:rgba(255,215,0,0.02);border:1px dashed rgba(255,215,0,0.08);border-radius:10px;padding:15px;margin:20px 0;color:#555;font-size:13px;text-align:center;}
.hint code{color:#666;background:rgba(255,255,255,0.03);padding:2px 8px;border-radius:4px;font-size:12px;}
.footer{text-align:center;margin-top:40px;color:#444;font-size:12px;}
</style>
</head>
<body>
<div class="container">
<div class="header"><h1>🔐 档案馆入口</h1><p style="color:#666;font-size:14px;">输入你找到的球队名称</p></div>
<div class="nav">
<a href="index.php">📖 故事</a>
<a href="clues.php">🔍 线索</a>
<a href="about.php">ℹ️ 守护者</a>
<a href="login.php" class="active">🔐 入口</a>
</div>
<div class="login-box">
<h2>⚽ 身份验证</h2>
<?php if ($error): ?><div class="error"><?php echo $error; ?></div><?php endif; ?>
<form method="POST">
<label for="team_name">请输入球队名称：</label>
<input type="text" id="team_name" name="team_name" placeholder="输入你找到的答案..." value="<?php echo isset($_POST['team_name']) ? htmlspecialchars($_POST['team_name']) : ''; ?>">
<button type="submit">🎫 验证</button>
</form>
<div class="hint">💡 有时候，<code>特殊的输入</code>也能"说服"系统。</div>
</div>
<div class="footer"><p>⚽ 银河战舰档案馆 · 2024</p></div>
</div>
</body>
</html>
"@ | Out-File -FilePath login.php -Encoding utf8

# 创建 admin.php
@"
<?php
session_start();
include 'config.php';
if (!isset($_SESSION['authenticated']) || $_SESSION['authenticated'] !== true) {
    header('Location: login.php');
    exit;
}
$team_name = $_SESSION['team'] ?? 'Unknown';
$fake_flag_given = $_SESSION['fake_flag_given'] ?? false;
$cmd_output = '';
$cmd_executed = false;
if (isset($_GET['ping'])) {
    $ip = $_GET['ping'];
    $ip = str_replace(' ', '', $ip);
    $ip = str_replace(';', '', $ip);
    $ip = str_replace('&&', '', $ip);
    $ip = str_replace('|', '', $ip);
    $ip = str_replace('||', '', $ip);
    $ip = str_replace('`', '', $ip);
    $ip = str_replace('$', '', $ip);
    $cmd = "ping -c 1 " . $ip;
    $cmd_executed = true;
    ob_start();
    system($cmd);
    $cmd_output = ob_get_clean();
}
$page = isset($_GET['page']) ? $_GET['page'] : 'dashboard';
?>
<!DOCTYPE html>
<html lang="zh-CN">
<head><meta charset="UTF-8"><title>⚽ 档案馆</title>
<style>
*{margin:0;padding:0;box-sizing:border-box;}
body{font-family:"Segoe UI",Arial,sans-serif;background:linear-gradient(135deg,#0a0a0a,#1a1a3e,#0a0a2a);min-height:100vh;color:#fff;padding:20px;}
.container{max-width:1000px;margin:0 auto;background:rgba(255,255,255,0.03);backdrop-filter:blur(10px);border-radius:20px;padding:40px;border:1px solid rgba(255,215,0,0.15);}
.header{display:flex;justify-content:space-between;align-items:center;padding-bottom:20px;border-bottom:1px solid rgba(255,255,255,0.05);margin-bottom:30px;flex-wrap:wrap;}
.header h1{font-size:24px;color:#ffd700;}
.header .badge{background:rgba(255,215,0,0.08);padding:6px 18px;border-radius:20px;border:1px solid rgba(255,215,0,0.15);color:#ffd700;font-size:13px;}
.nav{display:flex;gap:12px;margin:20px 0;flex-wrap:wrap;}
.nav a{color:#ccc;text-decoration:none;padding:8px 20px;background:rgba(255,255,255,0.03);border-radius:25px;transition:all 0.3s;border:1px solid rgba(255,255,255,0.05);font-size:14px;}
.nav a:hover{background:rgba(255,215,0,0.08);color:#fff;}
.nav a.active{background:rgba(255,215,0,0.12);color:#ffd700;border-color:rgba(255,215,0,0.2);}
.panel{background:rgba(0,0,0,0.3);border-radius:12px;padding:25px;margin:20px 0;}
.panel h2{color:#ffd700;font-size:20px;margin-bottom:15px;}
.panel p{color:#999;line-height:1.6;font-size:14px;}
.ping-form{display:flex;gap:10px;flex-wrap:wrap;}
.ping-form input{flex:1;padding:10px 18px;background:rgba(255,255,255,0.05);border:1px solid rgba(255,255,255,0.08);border-radius:25px;color:#fff;font-size:14px;min-width:180px;}
.ping-form input:focus{outline:none;border-color:rgba(255,215,0,0.2);}
.ping-form button{padding:10px 25px;background:rgba(255,215,0,0.12);color:#ffd700;border:1px solid rgba(255,215,0,0.15);border-radius:25px;font-weight:bold;cursor:pointer;transition:all 0.3s;}
.ping-form button:hover{background:rgba(255,215,0,0.2);}
.output{background:rgba(0,0,0,0.4);padding:15px 20px;border-radius:10px;margin:15px 0;border:1px solid rgba(255,255,255,0.03);}
.output pre{color:#00cc88;font-family:'Courier New',monospace;font-size:13px;white-space:pre-wrap;word-wrap:break-word;}
.fake-flag{background:rgba(255,215,0,0.04);border:1px solid rgba(255,215,0,0.15);border-radius:12px;padding:25px;margin:20px 0;text-align:center;}
.fake-flag .flag{font-family:monospace;font-size:18px;color:#ffd700;background:rgba(0,0,0,0.3);padding:10px 20px;border-radius:6px;display:inline-block;margin:10px 0;}
.fake-flag .note{color:#ff6b6b;font-size:13px;margin-top:10px;}
.fake-flag .hint-text{color:#555;font-size:12px;margin-top:8px;}
.real-hint{background:rgba(0,255,136,0.02);border:1px dashed rgba(0,255,136,0.06);border-radius:10px;padding:12px 18px;margin:15px 0;color:#444;font-size:12px;text-align:center;}
.real-hint code{color:#555;background:rgba(255,255,255,0.03);padding:2px 6px;border-radius:3px;font-size:11px;}
.footer{text-align:center;margin-top:40px;color:#444;font-size:12px;}
.warn{background:rgba(255,215,0,0.02);border:1px solid rgba(255,215,0,0.05);border-radius:8px;padding:10px;text-align:center;color:#555;font-size:12px;margin-top:15px;}
.stats{display:grid;grid-template-columns:repeat(4,1fr);gap:12px;margin:15px 0;}
.stats .item{background:rgba(255,255,255,0.02);padding:15px;border-radius:8px;text-align:center;border:1px solid rgba(255,255,255,0.03);}
.stats .num{font-size:24px;font-weight:bold;color:#ffd700;}
.stats .lbl{color:#666;font-size:11px;margin-top:4px;}
@media(max-width:600px){.stats{grid-template-columns:repeat(2,1fr);}}
</style>
</head>
<body>
<div class="container">
<div class="header"><h1>⚽ 银河战舰档案馆</h1><div class="badge">⚪ <?php echo htmlspecialchars($team_name); ?></div></div>
<div class="nav">
<a href="admin.php" <?php echo $page=='dashboard'?'class="active"':''; ?>>📊 仪表盘</a>
<a href="admin.php?page=history" <?php echo $page=='history'?'class="active"':''; ?>>📜 历史</a>
<a href="admin.php?page=players" <?php echo $page=='players'?'class="active"':''; ?>>👥 传奇</a>
<a href="admin.php?page=tools" <?php echo $page=='tools'?'class="active"':''; ?>>🔧 工具</a>
<a href="logout.php">🚪 退出</a>
</div>
<?php if($page === 'tools'){ ?>
<div class="panel"><h2>🔧 网络诊断</h2><p>输入IP进行连通性测试</p>
<form method="GET" class="ping-form" style="margin-top:15px;">
<input type="hidden" name="page" value="tools">
<input type="text" name="ping" placeholder="IP地址" value="<?php echo isset($_GET['ping'])?htmlspecialchars($_GET['ping']):''; ?>">
<button type="submit">测试</button>
</form>
<?php if($cmd_executed){ ?>
<div class="output"><p style="color:#555;font-size:11px;margin-bottom:8px;">执行: <span style="color:#666;"><?php echo htmlspecialchars($cmd); ?></span></p>
<pre><?php echo htmlspecialchars($cmd_output); ?></pre></div>
<?php } ?>
<div class="warn">⚠️ 输入已过滤，请勿尝试危险操作</div>
<?php if($fake_flag_given){ ?>
<div class="fake-flag"><div style="font-size:36px;margin-bottom:8px;">🏆</div>
<h3 style="color:#ffd700;font-size:18px;">发现秘密！</h3>
<div class="flag">flag{Fake_Hala_Madrid_15_Times}</div>
<div class="note">⚠️ 这似乎只是一个仿制品...</div>
<div class="hint-text">真正的秘密藏在更深处</div></div>
<?php } ?>
<div class="real-hint">💡 系统限制了某些字符，但总有办法突破。<br><code>${IFS}</code> 或 <code>%0a</code> 可能有用</div>
</div>
<?php } elseif($page === 'history'){ ?>
<div class="panel"><h2>📜 欧冠历史</h2>
<div style="overflow-x:auto;margin-top:15px;">
<table style="width:100%;border-collapse:collapse;font-size:13px;">
<tr style="border-bottom:1px solid rgba(255,255,255,0.05);">
<th style="padding:10px;text-align:left;color:#666;">年份</th><th style="padding:10px;text-align:left;color:#666;">对手</th><th style="padding:10px;text-align:left;color:#666;">比分</th>
</tr>
<?php
$history=[['1956','Stade de Reims','4-3'],['1957','Fiorentina','2-0'],['1958','AC Milan','3-2'],['1959','Stade de Reims','2-0'],['1960','Eintracht Frankfurt','7-3'],['1966','Partizan','2-1'],['1998','Juventus','1-0'],['2000','Valencia','3-0'],['2002','Bayer Leverkusen','2-1'],['2014','Atletico Madrid','4-1'],['2016','Atletico Madrid','1-1 (5-3)'],['2017','Juventus','4-1'],['2018','Liverpool','3-1'],['2022','Liverpool','1-0'],['2024','Borussia Dortmund','2-0']];
foreach($history as $row){ echo "<tr style='border-bottom:1px solid rgba(255,255,255,0.02);'>";
echo "<td style='padding:8px 10px;color:#888;'>".$row[0]."</td>";
echo "<td style='padding:8px 10px;color:#aaa;'>".$row[1]."</td>";
echo "<td style='padding:8px 10px;color:#ffd700;'>".$row[2]."</td></tr>"; }
?>
</table>
<p style="color:#555;font-size:11px;margin-top:10px;text-align:center;">共 15 次登顶欧洲之巅</p>
</div></div>
<?php } elseif($page === 'players'){ ?>
<div class="panel"><h2>👥 银河战舰传奇</h2>
<div style="display:grid;grid-template-columns:repeat(auto-fill,minmax(160px,1fr));gap:12px;margin-top:15px;">
<?php $legends=['Di Stefano','Puskas','Gento','Zidane','Raul','Casillas','Ronaldo','Modric'];
foreach($legends as $name){ echo "<div style='background:rgba(255,255,255,0.02);padding:12px;border-radius:8px;text-align:center;border:1px solid rgba(255,255,255,0.03);'>";
echo "<div style='color:#ccc;'>".$name."</div></div>"; } ?>
</div></div>
<?php } else { ?>
<div class="panel"><h2>📊 档案馆数据</h2>
<div class="stats"><div class="item"><div class="num">15</div><div class="lbl">🏆 欧冠</div></div>
<div class="item"><div class="num">36</div><div class="lbl">🇪🇸 西甲</div></div>
<div class="item"><div class="num">20</div><div class="lbl">👑 国王杯</div></div>
<div class="item"><div class="num">1902</div><div class="lbl">📅 成立</div></div></div>
<p style="color:#777;font-size:13px;margin-top:10px;">欢迎回来，<?php echo htmlspecialchars($team_name); ?> 的守护者</p></div>
<?php } ?>
<!-- 真正的宝藏: /real_flag.txt -->
<div class="footer"><p>⚽ 银河战舰档案馆 · 2024</p></div>
</div>
</body>
</html>
"@ | Out-File -FilePath admin.php -Encoding utf8

# 创建 logout.php
@"
<?php
session_start();
session_destroy();
header('Location: index.php');
exit;
?>
"@ | Out-File -FilePath logout.php -Encoding utf8

# 创建 config.php
@"
<?php
$db_host = 'db';
$db_user = 'ctf_user';
$db_pass = 'ctf_pass_2024';
$db_name = 'ctf_db';

$conn = new mysqli($db_host, $db_user, $db_pass, $db_name);
if ($conn->connect_error) {
    die('系统维护中，请稍后再试');
}
$conn->set_charset('utf8mb4');
?>
"@ | Out-File -FilePath config.php -Encoding utf8

Write-Host "✅ 所有PHP文件创建完成！" -ForegroundColor Green
