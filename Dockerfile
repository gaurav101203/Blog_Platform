# Use an official PHP runtime as a parent image
FROM php:8.1-apache

# Install PDO and MySQL driver
RUN docker-php-ext-install pdo pdo_mysql

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the current directory contents into the container
COPY . /var/www/html/

# Expose port 80 for the web server
EXPOSE 80

# Start the Apache server in the foreground
CMD ["apache2-foreground"]
