Deploy:

1. Clone normalmente: `git clone https://github.com/humbertodeveloper/webdev.git`
2. Abra o diretório webdev: `cd webdev`
3. Execute o docker compose com build: `docker compose up --build`

Obs.:

1. Ele vem com xdebug instalado e disponível na porta 9003
2. As outras configurações são feitas de acordo com o curso
3. Para acessar o phpmyadmin, deve acessar via url `localhost:8080`, colocar host `db`, credenciais `mysql:mysql`
4. Pode usar o Data Grip ou outro gerenciador de sua escolha, colocando o host `localhost` e credenciais `root:root`
5. Não colocar em servidor com IP público. O app está com muitas vulnerabilidades conhecidas.
