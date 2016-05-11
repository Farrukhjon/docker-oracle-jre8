FROM ubuntu:latest

MAINTAINER Farrukhjon D. SATTOROV, firedandy@gmail.com

# Install wget
RUN apt-get --quiet update && \
    apt-get --quiet --yes install wget && \
    apt-get clean

# Install JDK 8 
RUN wget --quiet \
         --output-document=/jre-8.tar.gz \
         --no-check-certificate \
         --no-cookies \
         --header "Cookie: oraclelicense=accept-securebackup-cookie" \
         http://download.oracle.com/otn-pub/java/jdk/8u66-b17/jre-8u66-linux-x64.tar.gz && \
    mkdir -p /usr/lib/jvm/jre1.8 && \
    tar --gunzip --extract --verbose --file /jre-8.tar.gz --directory /usr/lib/jvm/jre1.8 --strip-components 1 && \
    rm -f /jre-8.tar.gz && \
    chown -R root:root /usr/lib/jvm

# set the environment variables 
ENV JDK_HOME /usr/lib/jvm/jre1.8
ENV JAVA_HOME /usr/lib/jvm/jre1.8
ENV PATH $PATH:$JAVA_HOME/bin

# export meta-data about this container
ENV JAVA_VENDOR Oracle

