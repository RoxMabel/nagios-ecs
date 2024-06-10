FROM ubuntu:latest

RUN apt-get update && apt-get install -y wget build-essential apache2 php libapache2-mod-php libgd-dev unzip

RUN useradd nagios && usermod -aG nagios www-data

WORKDIR /tmp
RUN wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.4.6.tar.gz && \
    tar xzf nagios-4.4.6.tar.gz

WORKDIR /tmp/nagios-4.4.6
RUN ./configure --with-httpd-conf=/etc/apache2/sites-enabled && \
    make all && \
    make install && \
    make install-commandmode && \
    make install-init && \
    make install-config && \
    make install-webconf

RUN htpasswd -bc /usr/local/nagios/etc/htpasswd.users nagiosadmin nagiosadmin

RUN ln -s /etc/init.d/nagios /etc/rcS.d/S99nagios

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN a2enmod cgi

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
