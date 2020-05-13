FROM java:8-jre-alpine
LABEL maintainer="v.stone@163.com" \
      organization="Truth & Insurance Office" \
      github="https://github.com/apache/jmeter"

ADD https://github.com/apache/jmeter/archive/v5_0.tar.gz jmeter.tgz
ENV PKG_NAME apache-jmeter-5.0

RUN tar zvxf jmeter.tgz && \
    rm -rf jmeter.tgz && \
    ln -s /${PKG_NAME}/bin/jmeter /usr/local/bin/jmeter && \
    ln -s /${PKG_NAME}/bin/jmeter-server /usr/local/bin/jmeter-server && \
    echo '' >> /${PKG_NAME}/bin/jmeter.properties && \
    echo 'server.rmi.ssl.disable=true' >> /${PKG_NAME}/bin/jmeter.properties

WORKDIR /workspace
