FROM centos:6
MAINTAINER hejianlai
RUN yum install -y gcc gcc-c++ gd-devel libxml2-devel \
    libcurl-devel libjpeg-devel libpng-devel openssl-devel && \
    yum clean all
ADD php-5.6.31.tar.gz /tmp/
RUN cd /tmp/php-5.6.31 && \
    ./configure --prefix=/usr/local/php \
    --with-config-file-path=/usr/local/php/etc \
    --with-mysql --with-mysqli \
    --with-openssl --with-zlib --with-curl --with-gd \
    --with-jpeg-dir --with-png-dir --with-iconv \
    --enable-fpm --enable-zip --enable-mbstring && \
    make -j 4 && make install && \
    cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf && \
    sed -i "s/127.0.0.1/0.0.0.0/" /usr/local/php/etc/php-fpm.conf && \
    cp ./sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm && \
    chmod +x /etc/init.d/php-fpm && \
    rm -rf /tmp/php-5.6.31 
COPY php.ini /usr/local/php/etc

EXPOSE 9000
CMD /etc/init.d/php-fpm start && tail -F /var/log/messages
