# docker-dnsmasq-webproc

[![Docker Pulls](https://img.shields.io/docker/pulls/marcovolpato00/dnsmasq-webproc)](https://hub.docker.com/r/marcovolpato00/dnsmasq-webproc)
![MIT License](https://img.shields.io/github/license/marcovolpato00/docker-dnsmasq-webproc)

dnsmasq in a Docker container, configurable via a [simple web UI](https://github.com/jpillora/webproc).

## Features
- web UI
- custom DNS records
- runs on multiple architectures (**amd64, arm, arm64**)

## Usage

1. (optional, if you want persistence) Create [dnsmasq.conf](config/dnsmasq.conf) with this content:
    ```
    # dnsmasq config, for a complete example, see: http://oss.segetech.com/intra/srv/dnsmasq.conf

    # log all dns queries
    log-queries

    # dont use hosts nameservers
    no-resolv

    # use cloudflare as default nameservers
    server=1.0.0.1
    server=1.1.1.1

    # lan entries, DO NOT MODIFY!
    addn-hosts=/etc/lan.list
    ```

    And create [lan.list](config/lan.list). You can add your custom DNS entries here using this syntax:
    ```
    192.168.1.101   pc1.mydomain.com    pc1
    ```

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
        -v ./dnsmasq.conf:/etc/dnsmasq.conf \
        -v ./lan.list:/etc/lan.list \
        -e "HTTP_USER=admin" \
        -e "HTTP_PASS=dnsmasq" \
        --restart always \
        marcovolpato00/dnsmasq-webproc
    ```

3. Use the web UI visiting `http://<host_ip>:5380/`

## Credits
This project is based on [docker-dnsmasq](https://github.com/jpillora/docker-dnsmasq) by jpillora.

## MIT License
Copyright 2019 Marco Volpato

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.