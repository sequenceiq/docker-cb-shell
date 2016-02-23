FROM java:openjdk-7u79-jre

RUN apt-get update
RUN apt-get install zip
RUN apt-get install bash


ENV VERSION 1.2.0-dev.335
ADD https://s3-eu-west-1.amazonaws.com/maven.sequenceiq.com/releases/com/sequenceiq/cloudbreak-shell/$VERSION/cloudbreak-shell-$VERSION.jar /cloudbreak-shell.jar

COPY logback.xml /logback.xml

ADD start /start
ENTRYPOINT [ "/start" ]
