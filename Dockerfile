FROM php:5.6

USER root

# RUN rpm -Uvh https://www.softwarecollections.org/en/scls/remi/php56more/epel-7-x86_64/download/remi-php56more-epel-7-x86_64.noarch.rpm

RUN wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN wget http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN rpm -Uvh remi-release-7.rpm epel-release-latest-7.noarch.rpm

RUN yum install -y rh-php56 rh-php56-php-opcache rh-php56-php-pecl-memcache  && yum clean all
RUN yum install -y more-php56-php-pecl-apcu more-php56-php-tidy && yum clean all

# RUN rpm -Uvh https://www.softwarecollections.org/repos/remi/php56more/epel-7-x86_64/00141272-php-pecl-apcu/more-php56-php-pecl-apcu-4.0.8-1.el7.centos.x86_64.rpm
# RUN rpm -Uvh https://www.softwarecollections.org/repos/remi/php56more/epel-7-x86_64/more-php56-php-extras-5.6.5-2.remi/more-php56-php-tidy-5.6.5-2.el7.centos.x86_64.rpm

# ADD assemble /usr/libexec/s2i/assemble
# ADD run /usr/libexec/s2i/run

USER 1001