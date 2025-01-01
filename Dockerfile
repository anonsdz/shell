# Cài đặt Node.js phiên bản 20
FROM node:20

# Cài đặt npm mới nhất
RUN npm install -g npm@latest

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
