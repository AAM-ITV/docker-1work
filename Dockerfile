FROM maven:3.8.7-openjdk-18-slim as maven_builder
RUN apt install git -y
RUN git clone https://github.com/AAM-ITV/exam /tmp
WORKDIR /tmp/exam/
RUN mvn package

FROM tomcat:9.0.80-jdk21-openjdk-slim
COPY --from=maven_builder /tmp/exam/target/*.war usr/local/tomcat/webapps/
EXPOSE 80

