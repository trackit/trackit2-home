FROM ubuntu:16.04
MAINTAINER Romain Zanchi <romain@trackit.io>

RUN apt-get update
RUN apt-get install -y curl git

WORKDIR /
RUN curl -O https://dl.google.com/go/go1.9.2.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.9.2.linux-amd64.tar.gz
ENV PATH="/usr/local/go/bin:${PATH}"
RUN go get -u github.com/kardianos/govendor
ENV PATH="/root/go/bin:${PATH}"

COPY . /root/go/src/github.com/trackit
COPY compiler/compile_server.sh /compile_server.sh
ENTRYPOINT ["/compile_server.sh"]
