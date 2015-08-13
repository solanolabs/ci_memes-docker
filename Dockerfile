FROM ubuntu:14.04

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y git curl supervisor mysql-server nginx php5 php5-fpm php5-mcrypt php5-mysql nano

# Install subsystems
ADD run_services.sh /run_services.sh
ADD start-nginx.sh /start-nginx.sh
ADD start-mysqld.sh /start-mysqld.sh
ADD start-php5-fpm.sh /start-php5-fpm.sh
RUN sed -i 's/^log_error/#log_error/' /etc/mysql/my.cnf
ADD supervisord-nginx.conf /etc/supervisor/conf.d/supervisord-nginx.conf
ADD supervisord-mysqld.conf /etc/supervisor/conf.d/supervisord-mysqld.conf
ADD supervisord-php5-fpm.conf /etc/supervisor/conf.d/supervisord-php5-fpm.conf

# Configure nginx
#RUN sed -i 's/^;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php5/php-fpm/php.ini
RUN rm -f /etc/nginx/sites-available/default
ADD nginx-default /etc/nginx/sites-available/default

# Install database
ADD create-db.sql /create-db.sql
ADD create-db.sh /create-db.sh
RUN /create-db.sh

# Install app
RUN rm -rf /usr/share/nginx/html/*
ADD src /usr/share/nginx/html

# Setup tests
ADD run_tests.sh /run_tests.sh

EXPOSE 80

CMD ["/run_services.sh"]
