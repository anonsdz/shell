const express = require('express');
const path = require('path');
const pty = require('node-pty');
const WebSocket = require('ws');
const app = express();

// Tạo server HTTP để phục vụ ứng dụng web
const server = app.listen(8080, () => {
  console.log('Server started on http://localhost:8080');
});

// Cung cấp tệp static (HTML, CSS, JS)
app.use(express.static(path.join(__dirname, 'public')));

// WebSocket để giao tiếp với terminal
const wss = new WebSocket.Server({ server });

// Mở terminal khi có kết nối từ client
wss.on('connection', (ws) => {
  const ptyProcess = pty.spawn('bash', [], {
    name: 'xterm-256color',
    cols: 80,
    rows: 30,
    cwd: process.env.HOME,
    env: process.env
  });

  // Gửi dữ liệu terminal tới client qua WebSocket
  ptyProcess.on('data', (data) => {
    ws.send(data);
  });

  // Nhận dữ liệu từ client (gửi lệnh tới terminal)
  ws.on('message', (message) => {
    ptyProcess.write(message);
  });

  // Đóng terminal khi client ngắt kết nối
  ws.on('close', () => {
    ptyProcess.kill();
  });
});
