FROM centos:latest

RUN yum -y install epel-release
RUN yum -y install httpd hiredis

RUN yum -y install https://github.com/zmartzone/mod_auth_openidc/releases/download/v2.3.0/cjose-0.5.1-1.el7.centos.x86_64.rpm
RUN yum -y install https://github.com/zmartzone/mod_auth_openidc/releases/download/v2.3.3/mod_auth_openidc-2.3.3-1.el7.centos.x86_64.rpm && \
    yum clean all 

RUN mkdir /conf && ln -s /conf /etc/httpd/conf.d/conf

EXPOSE 80 443 8080

ENTRYPOINT [ "/usr/sbin/apachectl", "-DFOREGROUND" ]