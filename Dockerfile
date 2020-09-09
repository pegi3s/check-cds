FROM pegi3s/clustalomega:1.2.4
LABEL maintainer="hlfernandez"

# INSTALL COMPI
ADD image-files/compi.tar.gz /

# PLACE HERE YOUR DEPENDENCIES (SOFTWARE NEEDED BY YOUR PIPELINE)

COPY ./resources/scripts/* /opt/single-check-cds/

ENV PATH=/opt/single-check-cds:$PATH

# ADD PIPELINE
ADD pipeline.xml /pipeline.xml
ENTRYPOINT ["/compi", "run",  "-p", "/pipeline.xml"]
