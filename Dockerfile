FROM php:5.6

USER root
# https://www.softwarecollections.org/en/scls/rhscl/rh-php56/
# RUN rpm -Uvh https://www.softwarecollections.org/en/scls/remi/php56more/epel-7-x86_64/download/remi-php56more-epel-7-x86_64.noarch.rpm

RUN wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN wget http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN wget https://www.softwarecollections.org/en/scls/remi/php56more/epel-7-x86_64/download/remi-php56more-epel-7-x86_64.noarch.rpm

RUN rpm -Uvh remi-release-7.rpm epel-release-latest-7.noarch.rpm remi-php56more-epel-7-x86_64.noarch.rpm && \
    rm remi-release-7.rpm epel-release-latest-7.noarch.rpm remi-php56more-epel-7-x86_64.noarch.rpm

RUN yum install -y rh-php56 rh-php56-php-opcache rh-php56-php-pecl-memcache  && yum clean all
RUN yum install -y more-php56-php-pecl-imagick more-php56-php-pecl-apcu more-php56-php-tidy && yum clean all

ADD 20-php-kwf.ini /etc/opt/rh/rh-php56/php.d/20-php-kwf.ini

ADD assemble /usr/libexec/s2i/assemble
RUN chmod 750 /usr/libexec/s2i/assemble

ADD run /usr/libexec/s2i/run
RUN chmod 750 /usr/libexec/s2i/run

RUN mkdir -p /data/uploads
RUN chmod 777 /data/uploads

USER 1001