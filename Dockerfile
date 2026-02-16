FROM php:8.3-apache

# 1. Instala dependências e ferramentas de build
RUN apt-get update && apt-get install -y \
    $PHPIZE_DEPS \
    libmariadb-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql

# 2. Instala o Xdebug (apenas instalação, a config vai para o entrypoint)
RUN pecl install xdebug

# 3. Habilita mod_rewrite
RUN a2enmod rewrite

# 4. Copia e define o script de entrada
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]