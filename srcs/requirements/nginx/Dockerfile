FROM debian:bookworm

RUN apt-get update &&  apt-get install -y --no-install-recommends nginx openssl ca-certificates
    && mkdir /etc/nginx/ssl && rm -f /var/lib/apt/lists

EXPOSE 443

COPY

CMD ["nginx", "-g", "daemon off;"]