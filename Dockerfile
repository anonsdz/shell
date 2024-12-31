FROM node:16

WORKDIR /app

# Kiểm tra các tệp trong thư mục làm việc
RUN ls -al /app

COPY . .

# Kiểm tra lại các tệp sau khi COPY
RUN ls -al /app

RUN npm install

EXPOSE 8080

CMD ["npm", "start"]
