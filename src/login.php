<?php
session_start();
include 'config.php';
$error = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['team'])) {
    $input = $_POST['team'];
    $sql = "SELECT * FROM teams WHERE name = '$input'";
    $result = $conn->query($sql);
    if ($result && $result->num_rows > 0) {
        $team = $result->fetch_assoc();
        if (strtolower($team['name']) === 'real madrid' || strtolower($team['name']) === 'realmadrid') {
            $_SESSION['auth'] = true;
            $_SESSION['team'] = $team['name'];
            if (stripos($input, 'OR') !== false || stripos($input, '--') !== false || stripos($input, '1=1') !== false) {
                $_SESSION['fake'] = true;
            }
            header('Location: admin.php');
            exit;
        } else {
            $error = '❌ 再想想...';
        }
    } else {
        $g = strtolower(trim($input));
        if ($g === 'real madrid' || $g === 'realmadrid' || $input === '皇家马德里') {
            $error = '✅ 猜对啦！但直接报上名号可进不去——试试用点“特殊语法”，让门卫相信你就是他？';
        } else {
            $error = '❌ 未找到';
        }
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <style>
        body{font-family:Arial;background:#0a0a0a;color:#ccc;text-align:center;padding:50px}
        h2{color:#ffd700}
        input,button{padding:10px;background:#222;color:#fff;border:1px solid #333;border-radius:5px}
        button{background:#ffd700;color:#000;cursor:pointer}
        .box{max-width:400px;margin:0 auto;background:rgba(255,255,255,0.03);padding:30px;border-radius:10px}
        .error{color:#ff6b6b}
    </style>
</head>
<body>
    <div class="box">
        <h2>🔐 验证身份</h2>
        <?php if ($error): ?><p class="error"><?php echo $error; ?></p><?php endif; ?>
        <form method="POST">
            <input type="text" name="team" placeholder="球队名称" style="width:80%;">
            <br><br>
            <button type="submit">验证</button>
        </form>
        <!-- 5a6M5Yip55qE5rWL5L2g55+l6YGT562U5q2l -->
    </div>
</body>
</html>