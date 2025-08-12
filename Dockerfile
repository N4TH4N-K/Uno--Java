#Maven
FROM maven:3.9.11-eclipse-temurin-17 AS build
COPY . .
RUN mvn clean package -DskipTests

#JDK
FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/uno-backend-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]