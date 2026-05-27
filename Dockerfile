# Stage 1 - Build
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Stage 2 - Runtime
FROM eclipse-temurin:17-jre
RUN apt-get update && apt-get install -y \
    libxext6 libxrender1 libxtst6 libxi6 libx11-6 \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
CMD ["java", "-jar", "app.jar"]
