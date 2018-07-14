# Mirror one S3 bucket to another S3 bucket.
# tip @cobbzilla for his work at https://www.gittip.com/cobbzilla/
FROM openjdk:8-jre-alpine

MAINTAINER Jeeva

RUN apk add --no-cache git bash ca-certificates && \
    git clone --single-branch -b 2.1-stable https://github.com/jkailasam/s3s3mirror.git /opt/s3s3mirror && \
    apk del git && \
    rm -rf /opt/s3s3mirror/.git

WORKDIR /opt/s3s3mirror

ENTRYPOINT ["./s3s3mirror.sh"]
