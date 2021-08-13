# create builder container to use maven
FROM maven:3.8.1-jdk-11-slim AS builder
WORKDIR /app
COPY . ./
RUN mvn clean package

# create container to run java webapi and set environment variables
FROM amazoncorretto:11.0.12-alpine
WORKDIR /app
COPY --from=builder /app/target/locator-release.jar .
EXPOSE 8080
ENTRYPOINT ["java", "-Duser.timezone=GMT", "-jar", "locator-release.jar"]