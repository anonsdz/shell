# Sử dụng Node.js official image
FROM node:16

# Thiết lập thư mục làm việc
WORKDIR /app

# Copy các file cần thiết vào container
COPY . .

# Cài đặt các phụ thuộc
RUN npm install

# Expose cổng cho HTTP và WebSocket (8080)
EXPOSE 8080

# Lệnh chạy khi container khởi động
CMD ["node", "index.js"]
