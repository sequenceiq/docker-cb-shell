FROM gliderlabs/alpine

ENV JAVA_VERSION 7.75.2.5.4-r0
RUN apk-install bash openjdk7-jre-base=$JAVA_VERSION

ENV CLOUDBREAK_VERSION 0.2.30

ADD https://s3-eu-west-1.amazonaws.com/maven.sequenceiq.com/releases/com/sequenceiq/cloudbreak-shell/$CLOUDBREAK_VERSION/cloudbreak-shell-$CLOUDBREAK_VERSION.jar /cloudbreak-shell.jar
#COPY cloudbreak-shell-0.2.30.jar /cloudbreak-shell.jar

ADD start /start
ENTRYPOINT [ "/start" ]
