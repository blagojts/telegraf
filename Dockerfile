FROM quay.io/influxdb/telegraf-ci:1.11.5
WORKDIR /go/src/github.com/influxdata/telegraf
COPY ./ ./
RUN ./scripts/build.py --package --platform=linux --arch=amd64
RUN ./scripts/build.py --package --platform=windows --arch=amd64
ENTRYPOINT ["tail", "-f", "/dev/null"]
