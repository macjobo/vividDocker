FROM php:5.6

USER root

# RUN yum install -y php-pecl-memcache && yum clean all
# RUN yum install -y php-tidy php-pecl-apcu && yum clean all

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

RUN yum install -y php56w-fpm php56w-opcache php56w-pecl-apcu php56w-pecl-memcache php56w-tidy && \
yum clean all

# RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/SRPMS/p/php-pecl-apcu-4.0.11-1.el7.src.rpm
# RUN rpm -Uvh https://www.softwarecollections.org/en/scls/remi/php56more/epel-7-x86_64/download/remi-php56more-epel-7-x86_64.noarch.rpm
# RUN rpm -Uvh https://www.softwarecollections.org/repos/remi/php56more/epel-7-x86_64/more-php56-php-extras-5.6.5-2.remi/more-php56-php-tidy-5.6.5-2.el7.centos.x86_64.rpm

# ADD assemble /usr/libexec/s2i/assemble
# ADD run /usr/libexec/s2i/run

USER 1001
