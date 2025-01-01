# Sử dụng image Node.js chính thức từ Docker Hub
FROM node:18

# Cài đặt thư viện cần thiết
WORKDIR /app
COPY package*.json ./
RUN npm install

# Copy mã nguồn của bạn vào container
COPY . .

# Mở các cổng mà server của bạn sử dụng
EXPOSE 3000
EXPOSE 3001

# Chạy ứng dụng của bạn
CMD ["npm", "start"]
