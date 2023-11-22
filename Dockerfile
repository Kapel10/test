# Use an official Maven image as a parent image
FROM maven:3.9.4-eclipse-temurin-17 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project file
COPY pom.xml .

# Download dependencies and build the project
RUN mvn dependency:go-offline

# Copy the application files
COPY src ./src

# Build the application
RUN mvn package

FROM openjdk:17-oracle
# Set the working directory in the container
WORKDIR /app

# Copy the application JAR file into the container at /app
COPY --from=build /app/target/rahim-0.0.1-SNAPSHOT.jar /app/rahim.jar

# Expose the port that your application will run on
EXPOSE 8080

# Command to run your application
CMD ["java", "-jar", "rahim.jar"]