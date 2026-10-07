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

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader

# Expose port 8000
EXPOSE 8000

# Run database setup & start server at container runtime
CMD ["sh", "-c", "touch database/database.sqlite && php artisan key:generate --force && php artisan migrate:fresh --seed --force && php artisan serve --host=0.0.0.0 --port=8000"]
