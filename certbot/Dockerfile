FROM debian:stretch

COPY default.sh /etc/init.d/cert.sh

RUN apt-get update \
  && apt-get install -y letsencrypt \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/etc/init.d/cert.sh" ]

