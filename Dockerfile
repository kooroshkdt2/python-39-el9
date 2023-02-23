FROM registry.access.redhat.com/ubi9/python-39
USER root
ENV TZ=UTC
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

RUN  yum -y install python3-PyMySQL cairo pango  libffi libffi-devel python3-cairo libxml2-devel  python3-psycopg2.x86_64 \
    libpq.x86_64  openssl-devel.x86_64  xmlsec1-openssl.x86_64 libpq-devel.x86_64 gettext  &&\ 
    yum clean all    &&\ 
###################################### create run file  ###################################### 
    echo  'echo "before collect"' >> /usr/libexec/s2i/assemble  &&\
    echo  'wget -O .env http://$DP_PROVIDER/$DEPLOYMENT_NAME' >> /usr/libexec/s2i/assemble  &&\ 
    echo  'python manage.py collectstatic --noinput ' >>   /usr/libexec/s2i/assemble    && \
    echo  'echo "after collect2"' >>/usr/libexec/s2i/assemble  &&\ 
    echo  'echo "after compilemessages"' >>/usr/libexec/s2i/assemble    &&\ 
    #echo  'python manage.py migrate' >>   /usr/libexec/s2i/assemble  &&\
    #echo  'chmod 777 -R /opt/app-root/src/static/*   ' >>   /usr/libexec/s2i/assemble 
    chmod +x /usr/libexec/s2i/ -R    && \
    mkdir ./mediafiles  ./static    && \
    chown 1001:0 -R /usr/libexec/s2i/ -R  && \
    chmod 777 /usr/libexec/s2i/ -R   && \
    chmod +x /opt/ -R    && \
    chown 1001:0 -R /opt/ -R  && \
    chmod 777 /opt/ -R  && \
    pip3 install -U  pip setuptools cryptography 
USER 1001
