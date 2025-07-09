# Use Maven with Java 17
FROM maven:3.8.6-eclipse-temurin-17 AS build

# Set working directory inside the container
WORKDIR /app

# Copy Maven project files
COPY pom.xml .
COPY src ./src

# Build the project and download dependencies
RUN mvn clean install -DskipTests

# Now run tests
RUN mvn test

# Optional: final image (smaller) if you only want runtime (e.g., to inspect test results)
# FROM eclipse-temurin:17-jre-alpine
# COPY --from=build /app/target /app/target
# WORKDIR /app
# CMD ["java", "-jar", "target/your-app.jar"]
