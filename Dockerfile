FROM nginx:1.17.9-alpine
MAINTAINER luoqincai <sc.lqcai@gmail.com>

RUN mkdir -p /home/ssh

RUN set -x && \
apk add git openssh-client

VOLUME ["/home/ssh"]

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

EXPOSE 80

STOPSIGNAL SIGTERM

ENTRYPOINT ["/entrypoint.sh"]
