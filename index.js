const express = require('express');
const WebSocket = require('ws');
const SSHClient = require('ssh2').Client;
const path = require('path');

// Khởi tạo ứng dụng Express và WebSocket
const app = express();
const wss = new WebSocket.Server({ noServer: true });

// Cấu hình WebSocket server để truyền thông tin đến SSH console
wss.on('connection', (ws) => {
  const ssh = new SSHClient();

  // Kết nối SSH trực tiếp đến container
  ssh.on('ready', () => {
    ssh.shell((err, stream) => {
      if (err) return ws.send('Failed to start SSH shell.');

      ws.on('message', (msg) => {
        stream.write(msg);
      });

      stream.on('data', (data) => {
        ws.send(data.toString());
      });
    });
  })
  .connect({
    host: 'localhost',  // Kết nối đến SSH server trong container
    port: 22,           // Cổng SSH mặc định trong container
    username: 'user',   // Tên người dùng trong container
    password: 'password' // Mật khẩu người dùng trong container
  });
});

// Cấu hình Express để phục vụ giao diện web
app.use(express.static(path.join(__dirname, 'public')));

// WebSocket upgrade để tương tác với SSH shell
app.server = app.listen(8080, () => {
  console.log('SSH Console running at http://localhost:8080');
});

app.server.on('upgrade', (request, socket, head) => {
  wss.handleUpgrade(request, socket, head, (ws) => {
    wss.emit('connection', ws, request);
  });
});
