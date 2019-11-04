FROM alpine:latest

ARG ARCH=amd64

ENV WEBPROC_VERSION 0.3.0
ENV WEBPROC_URL https://github.com/jpillora/webproc/releases/download/v$WEBPROC_VERSION/webproc_${WEBPROC_VERSION}_linux_${ARCH}.gz

# fetch dnsmasq and webproc binary
RUN apk update \
	&& apk --no-cache add dnsmasq \
	&& apk add --no-cache --virtual .build-deps curl \
	&& curl -sL $WEBPROC_URL | gzip -d - > /usr/local/bin/webproc \
	&& chmod +x /usr/local/bin/webproc \
	&& apk del .build-deps

COPY config/dnsmasq.conf /etc/dnsmasq.conf
COPY config/lan.list /etc/lan.list

ENTRYPOINT ["webproc","--configuration-file","/etc/dnsmasq.conf","--configuration-file","/etc/lan.list","--","dnsmasq","--no-daemon"]
