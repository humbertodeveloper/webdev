#!/bin/bash
set -e

# Garante que as configurações do Xdebug estejam aplicadas
cat <<EOF > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
[xdebug]
xdebug.mode=debug
xdebug.start_with_request=yes
xdebug.client_host=host.docker.internal
xdebug.client_port=9003
xdebug.idekey=PHPSTORM
xdebug.log=/tmp/xdebug.log
EOF

# Ajusta permissões do log (opcional, para evitar erros de escrita)
touch /tmp/xdebug.log && chmod 666 /tmp/xdebug.log

docker-php-ext-enable xdebug
# Executa o comando principal do container (Apache)
exec apache2-foreground