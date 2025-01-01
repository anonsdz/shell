# Sử dụng image Ubuntu làm cơ sở
FROM ubuntu:latest

# Cập nhật hệ thống và cài đặt Apache, PHP, và các gói cần thiết
RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    libapache2-mod-php \
    curl \
    ufw \
    && apt-get clean

# Mở cổng 80 để Apache có thể phục vụ các request HTTP
EXPOSE 80

# Copy mã nguồn của bạn vào thư mục của Apache
COPY ./index.php /var/www/html/

# Cấu hình Apache để chạy
CMD service apache2 start && tail -f /dev/null
