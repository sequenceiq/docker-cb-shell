FROM mini/java

RUN apk-install bash

ENV VERSION 0.5.1
ADD https://s3-eu-west-1.amazonaws.com/maven.sequenceiq.com/releases/com/sequenceiq/cloudbreak-shell/$VERSION/cloudbreak-shell-$VERSION.jar /cloudbreak-shell.jar

COPY logback.xml /logback.xml

ADD start /start
ENTRYPOINT [ "/start" ]
