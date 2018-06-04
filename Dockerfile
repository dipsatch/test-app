FROM openjdk:8-jre-alpine
COPY target/app.jar /app.jar
WORKDIR /
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]