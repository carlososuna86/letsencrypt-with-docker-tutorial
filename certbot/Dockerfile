FROM debian:stretch

COPY init.sh /etc/init.d/

RUN apt-get update \
  && apt-get install -y letsencrypt \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/etc/init.d/init.sh" ]

