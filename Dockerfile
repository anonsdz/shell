# Sử dụng Node.js image
FROM node:18

# Đặt thư mục làm việc
WORKDIR /app

# Copy package.json và cài đặt dependencies
COPY package*.json ./
RUN npm install

# Copy toàn bộ mã nguồn ứng dụng
COPY . .

# Cài đặt Wetty (nếu chưa có)
RUN npm install -g wetty

# Mở cổng 3000 (cho ứng dụng web) và 3001 (cho Wetty terminal)
EXPOSE 3000 3001

# Chạy ứng dụng và Wetty terminal
CMD ["sh", "-c", "npm start & wetty --port 3001 --base /shell"]
