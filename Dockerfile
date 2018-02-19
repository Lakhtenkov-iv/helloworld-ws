FROM maven:latest as application
ARG BUILD_NUMBER
WORKDIR /usr/src/atsea
COPY . . 
RUN mvn clean install "-Dbuild.number=${BUILD_NUMBER}"

FROM tomcat:8.5.27-jre8-alpine
ARG BUILD_NUMBER
EXPOSE 8080

COPY --from=application /usr/src/atsea/target/sample-${BUILD_NUMBER}.war /$CATALINA_HOME/webapps/sample.war
RUN echo "running version ${BUILD_NUMBER}" > /$CATALINA_HOME/webapps/sample.ver

CMD ["catalina.sh", "run"]
