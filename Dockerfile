# Sử dụng Node.js phiên bản 20
FROM node:20

# Cài đặt npm phiên bản mới nhất
RUN npm install -g npm@latest

# Cài đặt ứng dụng của bạn
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Mở cổng và chạy ứng dụng
EXPOSE 3000
CMD ["npm", "start"]
