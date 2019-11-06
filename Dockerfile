FROM alpine:latest

ARG TARGETPLATFORM=linux/amd64

COPY download_webproc.sh /download_webproc.sh

RUN apk update \
	&& apk --no-cache add dnsmasq \
	&& apk add --no-cache --virtual .build-deps curl \
	&& /download_webproc.sh \
	&& chmod +x /usr/local/bin/webproc \
	&& apk del .build-deps

COPY config/dnsmasq.conf /etc/dnsmasq.conf
COPY config/lan.list /etc/lan.list

ENTRYPOINT ["webproc","--configuration-file","/etc/dnsmasq.conf","--configuration-file","/etc/lan.list","--","dnsmasq","--no-daemon"]
