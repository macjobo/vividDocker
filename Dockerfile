FROM php:5.6

USER root
RUN yum install -y php-tidy php-pecl-apcu php-pecl-memcache && yum clean all
# ADD assemble /usr/libexec/s2i/assemble
# ADD run /usr/libexec/s2i/run

USER default