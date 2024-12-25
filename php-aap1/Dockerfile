# Start from a PHP base image with Apache
FROM php:8.1-apache

# Install necessary extensions and packages
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Configure the PHP application
COPY index.php /var/www/html/
COPY menu.php /var/www/html/
COPY order.php /var/www/html/
COPY metrics.php /var/www/html/
# Expose the application port and the metrics port
EXPOSE 80


# Start Apache server
CMD apache2-foreground
