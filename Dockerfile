FROM ttbb/base

WORKDIR /opt/sh

ARG TARGETARCH

RUN wget https://dl.influxdata.com/influxdb/releases/influxdb-1.8.10_linux_$TARGETARCH.tar.gz  && \
mkdir -p /opt/sh/influxdb && \
tar -xf influxdb-1.8.10_linux_$TARGETARCH.tar.gz -C /opt/sh/influxdb --strip-components 2 && \
rm -rf /opt/sh/influxdb-1.8.10_linux_$TARGETARCH.tar.gz && \
ln -s /opt/sh/influxdb/influx /usr/bin/influx && \
ln -s /opt/sh/influxdb/influxd /usr/bin/influxd

ENV INFLUX_HOME /opt/sh/influxdb

WORKDIR /opt/sh/influxdb
