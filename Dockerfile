FROM mini/java

RUN apk-install bash

ENV VERSION 0.2.30
ADD https://s3-eu-west-1.amazonaws.com/maven.sequenceiq.com/releases/com/sequenceiq/cloudbreak-shell/$VERSION/cloudbreak-shell-$VERSION.jar /cloudbreak-shell.jar
ENV CLOUDBREAK_VERSION 0.2.30

ADD https://s3-eu-west-1.amazonaws.com/maven.sequenceiq.com/releases/com/sequenceiq/cloudbreak-shell/$CLOUDBREAK_VERSION/cloudbreak-shell-$CLOUDBREAK_VERSION.jar /cloudbreak-shell.jar
#COPY cloudbreak-shell-0.2.30.jar /cloudbreak-shell.jar

ADD start /start
ENTRYPOINT [ "/start" ]
