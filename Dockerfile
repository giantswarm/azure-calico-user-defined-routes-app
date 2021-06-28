FROM alpine:3.14

RUN apk add --no-cache iptables

COPY ensure-iptables-rule.sh /

RUN chmod +x ensure-iptables-rule.sh

ENTRYPOINT /ensure-iptables-rule.sh
