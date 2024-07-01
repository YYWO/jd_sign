FROM openjdk:8u212-jre-alpine3.9
MAINTAINER zhx47

EXPOSE 8080
WORKDIR /app
VOLUME /app/data/

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apk update \
    && apk add --no-cache curl unzip \
    && curl -L -o /root/jd_sign.zip https://github.com/YYWO/jd_sign/releases/download/1.0/jd_sign.zip \
    && unzip /root/jd_sign.zip -d /app \
    && rm -rf /root/jd_sign.zip

RUN chmod 777 /app/*

CMD ["/app/start.sh"]
