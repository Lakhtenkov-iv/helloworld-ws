FROM 8.5.27-jre8-alpine:latest

EXPOSE 8080

ADD ./tartget/sample-$BUILD_NUMBER.war /$CATALINA_HOME/webapps

CMD ["catalina.sh", "run"]
