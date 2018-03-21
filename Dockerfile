FROM openjdk:8

# 时区设置
RUN echo "Asia/shanghai" > /etc/timezone && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

EXPOSE 8080
VOLUME /tmp

ADD target/ureport_demo-0.0.1.jar /app.jar

RUN sh -c 'touch /app.jar'
ENV JAVA_OPTS=""

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]