FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY target/springmvc5-0.0.1-snapshot.war /app.war
CMD ["java","-war","/app.war"]
EXPOSE 2222
