FROM pegi3s/clustalomega:1.2.4
LABEL maintainer="hlfernandez"

ADD image-files/compi.tar.gz /

COPY ./resources/scripts/* /opt/single-check-cds/

ENV PATH=/opt/single-check-cds:$PATH

ADD pipeline.xml /pipeline.xml
ENTRYPOINT ["/compi", "run",  "-p", "/pipeline.xml"]
