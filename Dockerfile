# Chọn base image Node.js (có thể thay đổi phiên bản nếu cần)
FROM node:16

# Tạo và chuyển vào thư mục làm việc /app
WORKDIR /app

# Copy tất cả các file từ thư mục hiện tại vào container
COPY . .

# Cài đặt các phụ thuộc của dự án
RUN npm install

# Mở cổng 3000 (hoặc cổng mà ứng dụng của bạn sử dụng)
EXPOSE 3000

# Chạy ứng dụng Node.js
CMD ["node", "index.js"]
