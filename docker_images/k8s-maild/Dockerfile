FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
    rsyslog \
    supervisor \
    postfix \
    dovecot-imapd \
        dovecot-pop3d \
        dovecot-lmtpd \
    procps \
    htop \
    mc
RUN useradd -m -s /usr/sbin/nologin vmail
COPY nap.sh /root/nap.sh
COPY init.sh /root/init.sh
WORKDIR /root
ENTRYPOINT ["/root/nap.sh"]

# docker build -t jtulupov/k8s-maild .
