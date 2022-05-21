FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y bash maven git openssh-client gnupg libxml2-utils vim
RUN apt-get install -y openjdk-11-jdk
RUN apt-get install -y jq

COPY ./add-ssh-key.sh /usr/local/bin
COPY ./setup-maven-servers.sh /usr/local/bin
COPY ./release.sh /usr/local/bin
COPY ./settings-template.xml /usr/share/java/maven-3/conf/
COPY ./settings-server-template.xml /usr/share/java/maven-3/conf/
COPY ./simplelogger.properties /usr/share/java/maven-3/conf/logging/simplelogger.properties

ARG SETTINGS_TEMPLATE_FILE="/usr/share/java/maven-3/conf/settings-template.xml"
ENV SETTINGS_TEMPLATE_FILE=$SETTINGS_TEMPLATE_FILE

ARG SETTINGS_SERVER_TEMPLATE_FILE="/usr/share/java/maven-3/conf/settings-server-template.xml"
ENV SETTINGS_SERVER_TEMPLATE_FILE=$SETTINGS_SERVER_TEMPLATE_FILE

ARG SETTINGS_FILE="/usr/share/java/maven-3/conf/settings.xml"
ENV SETTINGS_FILE=$SETTINGS_FILE

RUN mkdir /root/.m2
