FROM debian:jessie
MAINTAINER Antoine Marchand <antoine@svilupo.fr>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y php5-common php5-cli php5-fpm php5-mcrypt php5-imap php5-mysqlnd php5-pgsql php5-apcu php5-gd php5-imagick php5-curl php5-intl php5-xsl php-pear wkhtmltopdf ssmtp

RUN sed -i -e "s/;daemonize = yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf && \
    sed -i "s/listen = \/var\/run\/php5-fpm.sock/listen = 0.0.0.0:9000/g" /etc/php5/fpm/pool.d/www.conf && \
    sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/"                  /etc/php5/fpm/php.ini && \
    sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/"        /etc/php5/fpm/php.ini 

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 9000

CMD ["php5-fpm", "-F"]
