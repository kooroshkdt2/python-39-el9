FROM registry.access.redhat.com/ubi9/python-39
USER root
ENV TZ=UTC
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

RUN  yum -y install --enablerepo=rhel-9-for-x86_64-appstream-rpms  python3-PyMySQL cairo pango  libffi libffi-devel python3-cairo libxml2-devel  python3-psycopg2.x86_64 \
     libpq.x86_64  openssl-devel.x86_64  xmlsec1-openssl.x86_64 libpq-devel.x86_64 gettext pango.x86_64  python3-cairo.x86_64  \
     gdk-pixbuf2-devel.x86_64  lcms2-devel.x86_64  openjpeg2.x86_64 pango-devel.x86_64 cairo-devel.x86_64 libtiff-devel.x86_64  \
     libwebp-devel.x86_64 libxml2-devel.x86_64 libpq-devel.x86_64  gettext-devel.x86_64 &&\ 
     yum -y install https://repo.almalinux.org/almalinux/9/CRB/x86_64/os/Packages/xmlsec1-devel-1.2.29-9.el9.x86_64.rpm &&\ 
     yum -y install https://repo.almalinux.org/almalinux/9/CRB/x86_64/os/Packages/libtool-ltdl-devel-2.4.6-45.el9.x86_64.rpm &&\ 
     yum clean all    &&\ 
###################################### create run file  ###################################### 
    echo  'echo "before collect"' >> /usr/libexec/s2i/assemble  &&\
    echo  'wget -O .env http://$DP_PROVIDER/$DEPLOYMENT_NAME' >> /usr/libexec/s2i/assemble  &&\ 
    echo  '$EXTRA_COMMAND_TO_RUN1' >> /usr/libexec/s2i/assemble  &&\  
    echo  '$EXTRA_COMMAND_TO_RUN2' >> /usr/libexec/s2i/assemble  &&\  
    echo  '$EXTRA_COMMAND_TO_RUN3' >> /usr/libexec/s2i/assemble  &&\
    echo  '$EXTRA_COMMAND_TO_RUN4' >> /usr/libexec/s2i/assemble  &&\  
    echo  '$EXTRA_COMMAND_TO_RUN5' >> /usr/libexec/s2i/assemble  &&\  
    echo  '$EXTRA_COMMAND_TO_RUN6' >> /usr/libexec/s2i/assemble  &&\  
    echo  '$EXTRA_COMMAND_TO_RUN7' >> /usr/libexec/s2i/assemble  &&\  
    echo  '$EXTRA_COMMAND_TO_RUN8' >> /usr/libexec/s2i/assemble  &&\ 
    chmod +x /usr/libexec/s2i/ -R    && \
    mkdir ./mediafiles  ./static    && \
    chown 1001:0 -R /usr/libexec/s2i/ -R  && \
    chmod 777 /usr/libexec/s2i/ -R   && \
    chmod +x /opt/ -R    && \
    chown 1001:0 -R /opt/ -R  && \
    chmod 777 /opt/ -R  && \
    pip3 install -U  pip setuptools cryptography  && \
    pip3 install wheel
USER 1001
