FROM eclipse-temurin:21-jdk

WORKDIR /applicationBackend
COPY applicationBackend/target/*.jar app.jar
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "applicationBackend.jar"]
