# docker-dnsmasq-webproc

dnsmasq in a docker container, configurable via a [simple web UI](https://github.com/jpillora/webproc).

## Features
- web UI
- custom DNS records
- runs on multiple architectures

## Usage

1. Create [dnsmasq.conf](config/dnsmasq.conf) and [lan.list](config/lan.list) (optional, if you want persistence)

2. Run

    You can use the docker-compose.yml provided:
    ```
    $ wget https://raw.githubusercontent.com/marcovolpato00/docker-dnsmasq-webproc/master/docker-compose.yml
    $ docker-compose up -d
    ```

    Without docker-compose:
    ```
    $ docker run \
        --name dnsmasq \
        -d \
        -p 53:53/udp \
        -p 5380:8080 \
        -v SOME_PATH/dnsmasq.conf:/etc/dnsmasq.conf \
        -v SOME_PATH/lan.list:/etc/lan.list \
        -e "HTTP_USER=admin" \
        -e "HTTP_PASS=dnsmasq" \
        --restart always \
        marcovolpato00/docker-dnsmasq-webproc
    ```