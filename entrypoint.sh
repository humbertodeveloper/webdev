#!/bin/bash
set -e

php /var/www/html/wdsapp/composer.phar install --no-interaction

# Configurações do Xdebug
cat <<EOF > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
[xdebug]
xdebug.mode=debug
xdebug.start_with_request=yes
xdebug.client_host=host.docker.internal
xdebug.client_port=9003
xdebug.idekey=PHPSTORM
xdebug.log=/tmp/xdebug.log
EOF

# Configurações para limpar o output e silenciar erros na tela
cat <<EOF > /usr/local/etc/php/conf.d/error_reporting.ini
display_errors=Off
display_startup_errors=Off
error_reporting=E_ALL
log_errors=On
html_errors=Off
EOF

# Garante que o log do Xdebug e do PHP existam e sejam graváveis
touch /tmp/xdebug.log && chmod 666 /tmp/xdebug.log

docker-php-ext-enable xdebug
# Executa o comando principal do container (Apache)
exec apache2-foreground