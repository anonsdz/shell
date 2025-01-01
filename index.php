<?php
// Tệp index.php

// Lệnh cần chạy
$command = 'node tlskill https://google.com/ 60 10 10 live.txt flood';

try {
    // Chạy lệnh trong terminal
    exec($command . " 2>&1", $output, $return_var);

    // Kiểm tra kết quả trả về
    if ($return_var === 0) {
        echo "✅ Lệnh đã chạy thành công!<br>";
        echo "Kết quả đầu ra:<br>";
        echo nl2br(htmlspecialchars(implode("\n", $output)));
    } else {
        throw new Exception("❌ Lỗi khi chạy lệnh. Mã lỗi: $return_var.<br>Kết quả đầu ra: " . nl2br(htmlspecialchars(implode("\n", $output))));
    }
} catch (Exception $e) {
    // Hiển thị thông báo lỗi
    echo $e->getMessage();
}

// Ghi log lỗi vào file nếu cần thiết
$error_log = '/var/www/html/error.log'; // Đường dẫn file log
if (!empty($e)) {
    file_put_contents($error_log, date('[Y-m-d H:i:s] ') . $e->getMessage() . PHP_EOL, FILE_APPEND);
}
?>
