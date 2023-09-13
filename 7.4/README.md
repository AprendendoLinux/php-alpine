## Webserver para o DokuWiki e o CRM da Limão Com Mel Modas

Esse projeto contém um webserver leve e robusto para para rodar a aplicação [DokuWiki](https://www.dokuwiki.org/dokuwiki) e CRM da [Limão com Mel Modas](https://www.limaocommelmodas.com.br).

## Subindo o contêiner:

    docker run -d --name='php' \
	    --hostname='php' \
	    -v php:/var/www/html \
	    -p 80:80 \
	--restart=always aprendendolinux/php-alpine:7.4

Caso prefira, você pode usar o Docker Composer com o arquivo [docker-compose.yml](https://github.com/AprendendoLinux/dokuwiki/blob/main/docker-compose.yml).

Se tiver qualquer dúvida, acesse meu site:

[https://www.henrique.tec.br](https://www.henrique.tec.br)

Atenciosamente,

**Henrique Fagundes** \
Analista de Suporte Gnu/Linux
