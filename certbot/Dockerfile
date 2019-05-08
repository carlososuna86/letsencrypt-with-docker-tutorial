FROM debian:stretch
 
RUN apt-get update \
  && apt-get install -y letsencrypt \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p /etc/letsencrypt/live/letsencrypt.devsidestory.com \
  && openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/letsencrypt/live/letsencrypt.devsidestory.com/privkey.pem \
    -out /etc/letsencrypt/live/letsencrypt.devsidestory.com/fullchain.pem \
    -subj /CN=letsencrypt.devsidestory.com

