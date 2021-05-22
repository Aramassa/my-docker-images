FROM alpine:3.13.5

RUN apk add --no-cache s-nail

ADD ./send.sh /usr/local/bin/

RUN chmod a+x /usr/local/bin/send.sh

ENTRYPOINT ["/usr/local/bin/send.sh"]
