FROM nginx:stable

ADD https://github.com/subchen/frep/releases/download/v1.3.7/frep-1.3.7-linux-amd64 /usr/bin/frep

COPY app.conf /default/
COPY nginx-conf /etc/init.d/

RUN \
     chmod +x /usr/bin/frep

ENTRYPOINT [ "/etc/init.d/nginx-conf" ]
