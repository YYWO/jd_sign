FROM openjdk:8u212-jre-alpine3.9
MAINTAINER zhx47

EXPOSE 8080
WORKDIR /app
VOLUME /app/data/

RUN chmod +x /app/start.sh

CMD ["/app/start.sh"]
