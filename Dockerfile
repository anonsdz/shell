# Chọn image Ubuntu mới nhất làm base
FROM ubuntu:latest

# Cập nhật danh sách package và cài đặt các công cụ cần thiết
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    nodejs \
    npm \
    python3 \
    python3-pip \
    curl \
    git \
    build-essential

# Cài đặt Node.js (nếu cần cài đặt phiên bản cụ thể, bạn có thể cài đặt từ các PPA hoặc source)
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash && \
    apt-get install -y nodejs

# Tạo thư mục làm việc trong container
WORKDIR /app

# Copy file index.js vào container
COPY index.js /app

# Mở cổng 3000 cho ứng dụng Node.js
EXPOSE 3000

# Lệnh chạy ứng dụng Node.js
CMD ["node", "index.js"]
