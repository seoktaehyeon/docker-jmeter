FROM java:8-jre-alpine
LABEL maintainer="v.stone@163.com" \
      organization="Truth & Insurance Office" \
      github="https://github.com/apache/jmeter"

ENV PKG_NAME apache-jmeter-5.0

RUN wget https://github.com/apache/jmeter/archive/v5_0.tar.gz -O ${PKG_NAME}.tgz && \
    tar zvxf ${PKG_NAME}.tgz && \
    rm -rf ${PKG_NAME}.tgz && \
    ln -s /${PKG_NAME}/bin/jmeter /usr/local/bin/jmeter && \
    ln -s /${PKG_NAME}/bin/jmeter-server /usr/local/bin/jmeter-server && \
    echo '' >> /${PKG_NAME}/bin/jmeter.properties && \
    echo 'server.rmi.ssl.disable=true' >> /${PKG_NAME}/bin/jmeter.properties

WORKDIR /workspace
