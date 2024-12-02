FROM maven:3.8.6-openjdk-11-slim as maven_builder
RUN apt update 
RUN apt install git -y
RUN git clone https://github.com/AAM-ITV/exam /tmp/project/exam
WORKDIR /tmp/project/exam/
RUN mvn package

FROM tomcat:9.0.80-jdk21-openjdk-slim
COPY --from=maven_builder /tmp/exam/target/*.war usr/local/tomcat/webapps/
EXPOSE 80

