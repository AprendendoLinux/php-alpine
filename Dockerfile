FROM alpine:3.12
ADD https://php.hernandev.com/key/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub
RUN echo "https://php.hernandev.com/v3.11/php-7.4" >> /etc/apk/repositories && \
	apk update && apk upgrade && apk add \
	\
    tzdata \
    apache2 \
    fcgi \
    php7 \
    php7-apache2 \
    php7-pdo_mysql \
    php7-mysqlnd \
    php7-mysqli \
    php7-gd \
    php7-cgi \
    php7-mbstring \
    php7-json \
    php7-session && \
    rm /var/cache/apk/* && \
    \
    ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && \
    ln -sf /dev/stdout /var/log/apache2/access.log && \
    ln -sf /dev/stderr /var/log/apache2/error.log && \
    \
    rm -rf /var/www/localhost/htdocs/* && \
    \
    sed -i "s/localhost\/htdocs/html/g" /etc/apache2/httpd.conf && \
    sed -i "s/localhost/html/g" /etc/apache2/httpd.conf && \
    \
    rm -r /var/www/localhost/htdocs && mkdir -p /var/www/html && \
    chown -R apache:apache /var/www/html && \
    \
    sed -i 's/;date.timezone =/date.timezone = America\/Sao_Paulo/g' /etc/php7/php.ini && \
    sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 2048M/g' /etc/php7/php.ini && \
    sed -i 's/post_max_size = 8M/post_max_size = 1024M/g' /etc/php7/php.ini && \
    echo 'AddDefaultCharset utf-8' >> /etc/apache2/httpd.conf
WORKDIR /root
EXPOSE 80
CMD ["httpd", "-D", "FOREGROUND"]