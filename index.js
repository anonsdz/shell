const http = require('http');

// Tạo một HTTP server
const server = http.createServer((req, res) => {
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end('Hello, mình là Negen');
});

// Lắng nghe trên cổng 3000
server.listen(3000, () => {
    console.log('Server is running on http://localhost:3000');
});
