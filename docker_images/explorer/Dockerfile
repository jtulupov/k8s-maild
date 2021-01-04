FROM ubuntu:18.04

RUN apt-get update && apt-get -y install dnsutils joe less telnet curl
COPY nap.sh /root/nap.sh
WORKDIR /root
ENTRYPOINT ["/root/nap.sh"]

# docker build -t jtulupov/explorer .