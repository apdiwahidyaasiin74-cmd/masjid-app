FROM php:8.3-cli

# Install dependencies and SQLite extension
RUN apt-get update && apt-get install -y \
    libsqlite3-dev \
    zip \
    unzip \
    git \
    curl \
    && docker-php-ext-install pdo pdo_sqlite

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Copy application files
COPY . .

# Install PHP dependencies & setup SQLite database
RUN composer install --no-dev --optimize-autoloader
RUN touch database/database.sqlite
RUN php artisan migrate:fresh --seed --force
RUN php artisan config:clear && php artisan cache:clear && php artisan view:clear

# Expose port 8000
EXPOSE 8000

# Start Laravel server
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
