FROM php:5.6

USER root
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum install -y php-tidy php-pecl-apcu php-pecl-memcache && \
    yum clean all
# ADD assemble /usr/libexec/s2i/assemble
# ADD run /usr/libexec/s2i/run

USER 1001
