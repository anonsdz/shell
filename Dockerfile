# Sử dụng Node.js 18
FROM node:18

# Cài đặt npm phiên bản tương thích
RUN npm install -g npm@10

# Tạo thư mục làm việc
WORKDIR /app

# Sao chép package.json và package-lock.json
COPY package*.json ./

# Cài đặt dependencies
RUN npm install

# Sao chép toàn bộ mã nguồn vào container
COPY . .

# Mở cổng 3000 và 3001 (cho terminal)
EXPOSE 3000 3001

# Chạy ứng dụng và Wetty terminal
CMD ["sh", "-c", "npm start & wetty --port 3001 --base /shell"]
