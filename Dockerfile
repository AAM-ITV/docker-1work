FROM maven:3.8.6-openjdk-11-slim as maven_builder
COPY . /tmp/webapp/
WORKDIR /tmp/webapp/
RUN mvn package
FROM tomcat:9.0.0-jre8-alpine
COPY --from=maven_builder /tmp/webapp/*.war /usr/local/tomcat/webapps
EXPOSE 8080


