FROM java:8-jre-alpine
LABEL maintainer="v.stone@163.com" \
      organization="Truth & Insurance Office" \
      github="https://github.com/apache/jmeter" \
      website="https://jmeter.apache.org"

ADD http://mirrors.tuna.tsinghua.edu.cn/apache//jmeter/binaries/apache-jmeter-5.0.tgz /opt/jmeter/

RUN cd /opt/jmeter && \
    jmeter_root_dir=$(ls) && \
    ln -s /opt/jmeter/${jmeter_root_dir}/bin/jmeter /usr/local/bin/jmeter && \
    ln -s /opt/jmeter/${jmeter_root_dir}/bin/jmeter-server /usr/local/bin/jmeter-server && \
    echo '' >> /opt/jmeter/${jmeter_root_dir}/bin/jmeter.properties && \
    echo 'server.rmi.ssl.disable=true' >> /opt/jmeter/${jmeter_root_dir}/bin/jmeter.properties

WORKDIR /workspace
