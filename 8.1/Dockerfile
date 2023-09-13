FROM alpine
RUN apk update && apk upgrade && apk add \
	\
    tzdata \
    apache2 \
    fcgi \
    php81 \
    php81-apache2 \
    php81-pdo_mysql \
    php81-mysqlnd \
    php81-mysqli \
    php81-gd \
    php81-cgi \
    php81-mbstring \
    php81-json \
    php81-xml \
    php81-zlib \
    php81-ldap \
    php81-session && \
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
    sed -i 's/;date.timezone =/date.timezone = America\/Sao_Paulo/g' /etc/php81/php.ini && \
    sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 2048M/g' /etc/php81/php.ini && \
    sed -i 's/post_max_size = 8M/post_max_size = 1024M/g' /etc/php81/php.ini && \
    echo 'AddDefaultCharset utf-8' >> /etc/apache2/httpd.conf && \
    echo '<LocationMatch "/(data|conf|bin|inc|vendor)/">' >> /etc/apache2/httpd.conf && \
    echo 'Order allow,deny' >> /etc/apache2/httpd.conf && \
    echo 'Deny from all' >> /etc/apache2/httpd.conf && \
    echo 'Satisfy All' >> /etc/apache2/httpd.conf && \
    echo '</LocationMatch>' >> /etc/apache2/httpd.conf
WORKDIR /root
EXPOSE 80
CMD ["httpd", "-D", "FOREGROUND"]
