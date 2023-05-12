#!/bin/sh

useradd www
chown -R www /var/www/localhost/
chmod +x /var/www/localhost/
exec lighttpd -D -f /etc/lighttpd/lighttpd.conf
