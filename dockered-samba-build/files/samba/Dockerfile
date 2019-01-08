FROM debian:9.6
LABEL maintainer="Varlog <varlog.err@gmail.com>"

ENV TINI_VERSION=v0.18.0
ENV DATA_DIR=/app
ENV SAMBA_CONF_DIR=/etc/samba
ENV SAMBA_CONF=${SAMBA_CONF_DIR}/smb.conf
ENV SAMBA_CUSTOM_CONF_DIR=${SAMBA_CONF_DIR}/conf.d

# install samba
RUN  apt-get update \
  && apt-get install -y samba \
  && apt-get clean -y

# create custom config directory
RUN mkdir ${SAMBA_CUSTOM_CONF_DIR}

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/local/bin
COPY docker-entrypoint.sh /usr/local/bin

RUN  cd /usr/local/bin \
  && chmod +x tini \
  && chmod +x docker-entrypoint.sh

VOLUME ["/data"]

EXPOSE 445

ENTRYPOINT ["tini", "--"]
CMD /usr/local/bin/docker-entrypoint.sh
