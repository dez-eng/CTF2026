<?php
session_start();
if (!isset($_SESSION['auth'])) {
    header('Location: login.php');
    exit;
}
$team = $_SESSION['team'] ?? '';
$fake = $_SESSION['fake'] ?? false;
$output = '';
if (isset($_GET['ping'])) {
    $ip = $_GET['ping'];
    
    // 1. 空格
    $ip = str_replace(' ', '', $ip);
    
    // 1.1 单双引号(阻断 c'a't / fl'a'g 拼接;必须放在关键词过滤之前执行)
    $ip = str_replace("'", '', $ip);
    $ip = str_replace('"', '', $ip);
    
    // 2. 分号
    $ip = str_replace(';', '', $ip);
    
    // 3. && 和 ||
    $ip = str_replace('&&', '', $ip);
    $ip = str_replace('||', '', $ip);
    
    // 4. 管道符
    $ip = str_replace('|', '', $ip);
    
    // 5. 反引号
    $ip = str_replace('`', '', $ip);
    
    // 6. $ 符号
    $ip = str_replace('$', '', $ip);
    
    // 7. 重定向
    $ip = str_replace('>', '', $ip);
    $ip = str_replace('<', '', $ip);
    
    // 8. 通配符
    $ip = str_replace('*', '', $ip);
    $ip = str_replace('?', '', $ip);
    
    // 9. 常用查看命令
    $view_commands = ['cat', 'tac', 'head', 'tail', 'less', 'more', 'nl', 'awk', 'sed', 'grep'];
    foreach ($view_commands as $cmd) {
        $ip = str_replace($cmd, '', $ip);
    }
    
    // 10. 网络命令
    $net_commands = ['curl', 'wget', 'nc', 'netcat', 'nslookup', 'dig', 'host'];
    foreach ($net_commands as $cmd) {
        $ip = str_replace($cmd, '', $ip);
    }
    
    // 11. 编码命令
    $ip = str_replace('base64', '', $ip);
    $ip = str_replace('xxd', '', $ip);
    $ip = str_replace('hexdump', '', $ip);
    
    // 12. 其他危险命令
    $danger_commands = ['find', 'xargs', 'sh', 'bash', 'zsh', 'perl', 'python', 'ruby'];
    foreach ($danger_commands as $cmd) {
        $ip = str_replace($cmd, '', $ip);
    }
    
    // 13. 敏感关键词
    $sensitive = ['flag', 'root', 'passwd', 'shadow', 'etc'];
    foreach ($sensitive as $word) {
        $ip = str_replace($word, '', $ip);
    }
    
    // 执行命令（完整输出）
    $cmd = "ping -c 1 " . $ip;
    $output = shell_exec($cmd . " 2>&1");
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台</title>
    <style>
        body{font-family:Arial;background:#0a0a0a;color:#ccc;padding:20px}
        .box{max-width:800px;margin:0 auto;background:rgba(255,255,255,0.03);padding:30px;border-radius:10px}
        h2,h3{color:#ffd700}
        input,button{padding:8px;background:#222;color:#fff;border:1px solid #333;border-radius:5px}
        button{background:#ffd700;color:#000;cursor:pointer}
        pre{background:#111;padding:10px;border-radius:5px;color:#00ff88;white-space:pre-wrap;word-wrap:break-word}
        .fake{color:#ffd700}
        .note{color:#666;font-size:12px}
        hr{border-color:#333}
    </style>
</head>
<body>
    <div class="box">
        <h2>⚽ 档案馆后台</h2>
        <p>欢迎, <span style="color:#ffd700;"><?php echo htmlspecialchars($team); ?></span></p>
        <hr>
        <h3>🔧 网络诊断</h3>
        <p style="color:#666;font-size:12px;">输入IP进行连通性测试（已启用安全过滤）</p>
        <form method="GET">
            <input type="text" name="ping" placeholder="IP地址">
            <button type="submit">测试</button>
        </form>
        <p class="note" style="margin-top:10px;">💡 小提示：这台“网络诊断”工具远比表面看起来能干；而真正的宝物从不摆在展柜里——它在服务器文件系统深处，某个以 . 开头的隐秘角落，还裹了好几层……</p>
        <?php if ($output): ?>
        <pre><?php echo htmlspecialchars($output); ?></pre>
        <?php endif; ?>
        <?php if ($fake): ?>
        <hr>
        <p class="fake">🏆 flag{Fake_Hala_Madrid_15_Times}</p>
        <p class="note">⚠️ 仿制品</p>
        <?php endif; ?>
        <hr>
        <p style="color:#444;font-size:12px;"><a href="logout.php" style="color:#666;">退出</a></p>
    </div>
</body>
</html>