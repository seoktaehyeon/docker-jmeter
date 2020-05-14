FROM java:8-jre-alpine
LABEL maintainer="v.stone@163.com" \
      organization="Truth & Insurance Office" \
      github="https://github.com/apache/jmeter" \
      website="https://jmeter.apache.org"

ADD https://github.com/apache/jmeter/archive/v5_0.tar.gz /opt/jmeter/

RUN cd /opt/jmeter && \
    jmeter_root_dir=$(ls) && \
    ln -s /opt/jmeter/${jmeter_root_dir}/bin/jmeter /usr/local/bin/jmeter && \
    ln -s /opt/jmeter/${jmeter_root_dir}/bin/jmeter-server /usr/local/bin/jmeter-server && \
    echo '' >> /opt/jmeter/${jmeter_root_dir}/bin/jmeter.properties && \
    echo 'server.rmi.ssl.disable=true' >> /opt/jmeter/${jmeter_root_dir}/bin/jmeter.properties

WORKDIR /workspace
