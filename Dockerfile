# Stage 1: Build the JAR file
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app

# Copy the project files
COPY pom.xml .
COPY src ./src

# Build the application (skipping tests for speed in this demo)
RUN mvn clean package -DskipTests

# Stage 2: Create the runtime image
FROM openjdk:17-jdk-slim
WORKDIR /app

# Copy only the built JAR from the previous stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port your Java app runs on (usually 8080)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]