# Dockerfile

# Sử dụng image PHP và Apache
FROM php:8.3-apache

# Cài đặt các gói cần thiết
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    vim \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean

# Tạo thư mục làm việc
WORKDIR /var/www/html

# Sao chép mã nguồn vào container
COPY index.php /var/www/html/index.php

# Cấp quyền cho thư mục nếu cần thiết
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Mở cổng 80
EXPOSE 80

# Khởi động Apache
CMD ["apache2-foreground"]
