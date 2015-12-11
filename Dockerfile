FROM debian
MAINTAINER Antoine Marchand <antoine@svilupo.fr>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y php5-common php5-cli php5-fpm php5-mcrypt php5-mysqlnd php5-apcu php5-gd php5-imagick php5-curl php5-intl

RUN sed -i "s/;daemonize = yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf
RUN sed -i "s/listen = \/var\/run\/php5-fpm.sock/listen = 0.0.0.0:9000/g" /etc/php5/fpm/pool.d/www.conf

EXPOSE 9000

CMD ["php5-fpm", "-F"]
