# Use the official PHP 8.3 FPM image as the base image
FROM php:8.3-fpm

# Install gd extension
RUN apt-get update && \
		apt-get install -y \
		libfreetype-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
		libwebp-dev \
	&& docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
	&& docker-php-ext-install -j$(nproc) gd

# Install msgpack extension
RUN pecl install msgpack && docker-php-ext-enable msgpack