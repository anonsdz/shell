# Sử dụng Ubuntu làm cơ sở
FROM ubuntu:20.04

# Cài đặt các gói cần thiết
RUN apt-get update && apt-get install -y \
    openssh-server \
    nodejs \
    npm \
    && mkdir /var/run/sshd

# Cài đặt xterm.js và thư viện cần thiết cho Node.js
RUN npm install -g express ssh2 xterm ws

# Copy mã nguồn vào trong container
COPY . /app
WORKDIR /app

# Mở port SSH và port Node.js
EXPOSE 22 8080

# Tạo user để SSH và thiết lập mật khẩu
RUN useradd -m user && echo "user:password" | chpasswd

# Khởi động SSH server và Node.js server
CMD service ssh start && node index.js
