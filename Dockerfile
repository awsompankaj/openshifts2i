FROM centos:latest
RUN yum install httpd -y
RUN sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf
COPY src/ /var/www/html/
RUN chown apache:root /var/run/httpd /var/log/httpd
RUN chmod -R 777 /var/run/httpd /var/log/httpd
EXPOSE 8080
user apache
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
