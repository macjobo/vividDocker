FROM php:5.6

USER root

ADD assemble /usr/libexec/s2i/assemble
# ADD run /usr/libexec/s2i/run

USER 1001