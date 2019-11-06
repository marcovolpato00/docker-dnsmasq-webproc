#!/bin/sh

echo $TARGETPLATFORM

case $TARGETPLATFORM in
    linux/amd64)
        ARCH="amd64"
        ;;
    linux/arm/v7)
        ARCH="armv7"
        ;;
    linux/arm64)
        ARCH="arm64"
        ;;
esac

WEBPROC_VERSION=0.3.0
WEBPROC_URL="https://github.com/jpillora/webproc/releases/download/v$WEBPROC_VERSION/webproc_${WEBPROC_VERSION}_linux_${ARCH}.gz"

curl -sL $WEBPROC_URL | gzip -d - > /usr/local/bin/webproc
