FROM debian:9.6
LABEL maintainer="Varlog <varlog.err@gmail.com>"

ENV TINI_VERSION=v0.18.0
ENV DATA_DIR=/app

RUN apt-get update \
    && apt-get install -y samba \
    && apt-get clean

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/local/bin
COPY /usr/src/samba/docker-entrypoint.sh /usr/local/bin

RUN  cd /usr/local/bin \
  && chmod +x tini \
  && chmod +x docker-entrypoint.sh

ENTRYPOINT ["tini", "--"]
CMD /usr/local/bin/docker-entrypoint.sh
