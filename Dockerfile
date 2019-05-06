FROM alpine:3.9
LABEL author="Serge NOEL <serge.noel@net6a.com.fr>"

RUN apk add --no-cache php7-apache2 php7-session php7-gd php7-curl php7-mysqli 
RUN sed -i "s|/var/www/localhost/htdocs|/var/www/html|g" /etc/apache2/httpd.conf
RUN mkdir /var/www/html \
    && cd /var/www/html

ADD Files/ /

VOLUME /var/www/DoliFiles
EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
