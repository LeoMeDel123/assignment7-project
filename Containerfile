FROM fedora
RUN dnf -yqq upgrade
RUN dnf -yqq install httpd

RUN sudo mkdir /structure
RUN sudo chmod 777 /structure 
 
RUN mkdir /structure/sync-work
RUN chown sync /structure/sync-work

RUN mkdir /structure/nobody-work
RUN chown nobody /structure/nobody-work

RUN adduser --uid 5000 collin

COPY index.html /var/www/html/
RUN echo "Containers are easy!" >> /var/www/html/index.html
EXPOSE 80
ENTRYPOINT /usr/sbin/httpd -DFOREGROUND
