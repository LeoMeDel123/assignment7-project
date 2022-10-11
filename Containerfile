FROM fedora
RUN dnf -yqq upgrade
RUN dnf -yqq install httpd

RUN sudo mkdir /structure
RUN sudo chmod 777 /structure 

USER sync  
RUN mkdir /structure/sync-work

USER nobody
RUN mkdir /structure/nobody-work

USER root
RUN adduser --uid 5000 collin

COPY index.html /var/www/html/
RUN echo "Containers are easy!" >> /var/www/html/index.html
EXPOSE 80
ENTRYPOINT /usr/sbin/httpd -DFOREGROUND
