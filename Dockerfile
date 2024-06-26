FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

## Install php nginx mysql supervisor
RUN apt-get update && \
    apt-get install -y \
        php7.4-fpm \
        php7.4-mysql \
        php7.4-gd \
        php7.4-mbstring \
        php7.4-curl \
        nginx \
        curl \
        supervisor && \
    echo "mysql-server mysql-server/root_password password" | debconf-set-selections && \
    echo "mysql-server mysql-server/root_password_again password" | debconf-set-selections && \
    apt-get install -y mysql-server && \
    rm -rf /var/lib/apt/lists/*

## Configuration
RUN sed -i 's/^listen\s*=.*$/listen = 127.0.0.1:9000/' /etc/php/7.4/fpm/pool.d/www.conf && \
    sed -i 's/^\;error_log\s*=\s*syslog\s*$/error_log = \/var\/log\/php\/cgi.log/' /etc/php/7.4/fpm/php.ini && \
    sed -i 's/^\;error_log\s*=\s*syslog\s*$/error_log = \/var\/log\/php\/cli.log/' /etc/php/7.4/cli/php.ini && \
    sed -i 's/^key_buffer\s*=/key_buffer_size =/' /etc/mysql/mysql.conf.d/mysqld.cnf

COPY files/root /

WORKDIR /var/www/

VOLUME ["/var/www/", "/var/lib/mysql/"]

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
