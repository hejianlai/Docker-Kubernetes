FROM centos:7
RUN yum install -y gcc gcc-c++ make openssl-devel pcre-devel
ADD nginx-1.12.1.tar.gz /tmp

RUN cd /tmp/nginx-1.12.1 && \
    ./configure --prefix=/usr/local/nginx && \
    make -j 2 && \
    make install

RUN rm -rf /tmp/nginx-1.12.1* && yum clean all

COPY nginx.conf /usr/local/nginx/conf

WORKDIR /usr/local/nginx
EXPOSE 80
CMD ["./sbin/nginx", "-g", "daemon off;"]
