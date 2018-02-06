FROM tomcat:8.5.27-jre8-alpine

EXPOSE 8080

ADD ./target/sample-$BUILD_NUMBER.war /$CATALINA_HOME/webapps

CMD ["catalina.sh", "run"]
