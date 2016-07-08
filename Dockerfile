FROM php:5.6

USER root
# https://www.softwarecollections.org/en/scls/rhscl/rh-php56/
# RUN rpm -Uvh https://www.softwarecollections.org/en/scls/remi/php56more/epel-7-x86_64/download/remi-php56more-epel-7-x86_64.noarch.rpm

RUN wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN wget http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN wget https://www.softwarecollections.org/en/scls/remi/php56more/epel-7-x86_64/download/remi-php56more-epel-7-x86_64.noarch.rpm

RUN rpm -Uvh remi-release-7.rpm epel-release-latest-7.noarch.rpm remi-php56more-epel-7-x86_64.noarch.rpm

RUN yum install -y rh-php56 rh-php56-php-opcache rh-php56-php-pecl-memcache  && yum clean all
RUN yum install -y more-php56-php-pecl-apcu more-php56-php-tidy && yum clean all

ADD assemble /usr/libexec/s2i/assemble
RUN chown 1001 /usr/libexec/s2i/assemble
# ADD run /usr/libexec/s2i/run

USER 1001