<?php
// ============================================
// 银河档案馆 · 内部加密脚本(勿外传)
// 归档时使用,请勿删除
// ============================================

// 密钥(管理员手记:银河战舰 15 冠)
$key = 'HalaMadrid15';

// 加密:逐字符 与密钥循环异或,再按位置位移
function enc_flag($s, $key) {
    $out = '';
    $len = strlen($s);
    $klen = strlen($key);
    for ($i = 0; $i < $len; $i++) {
        $c = ord($s[$i]) ^ ord($key[$i % $klen]);   // XOR 密钥(循环)
        $c = ($c + $i * 3 + 5) % 256;               // 位置相关位移
        $out .= chr($c);
    }
    return bin2hex($out);                           // 转十六进制存储
}

// 解密:逆运算
function dec_flag($h, $key) {
    $raw = hex2bin($h);
    $out = '';
    $len = strlen($raw);
    $klen = strlen($key);
    for ($i = 0; $i < $len; $i++) {
        $c = ord($raw[$i]);
        $c = ($c - $i * 3 - 5 + 256) % 256;         // 逆位移
        $out .= chr($c ^ ord($key[$i % $klen]));    // 逆 XOR
    }
    return $out;
}
?>
