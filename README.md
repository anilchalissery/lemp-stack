lemp-stack
===========
[![nginx version](https://img.shields.io/badge/nginx-1.18.0-green)](https://nginx.org/)
[![PHP version](https://img.shields.io/badge/PHP-7.4.3-blue)](https://www.php.net/)
[![MySQL version](https://img.shields.io/badge/MySQL-8.0.37-orange)](https://www.mysql.com/)



# Usage

    docker run -d --name=lemp \
      -v /path/to/www/:/var/www/ \
      -v /path/to/mysql:/var/lib/mysql \
      -p port_of_nginx:80 \
      anilchalissery/lemp-stack:latest

