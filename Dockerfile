FROM bitnami/minideb
RUN apt update && install_packages lighttpd libfcgi0ldbl
COPY start.sh /usr/local/bin/
RUN chown root /usr/local/bin/start.sh && chmod +x /usr/local/bin/start.sh
CMD ["start.sh"]
