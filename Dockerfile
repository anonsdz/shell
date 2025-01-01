# Sử dụng hình ảnh PHP với Apache
FROM php:8.3-apache

# Cài đặt Node.js
RUN apt-get update && apt-get install -y \
    curl \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Kích hoạt mod_rewrite của Apache
RUN a2enmod rewrite

# Sao chép mã nguồn vào container
COPY . /var/www/html

# Thiết lập quyền
RUN chown -R www-data:www-data /var/www/html

# Mở cổng 80
EXPOSE 80

# Khởi động Apache
CMD ["apache2-foreground"]
