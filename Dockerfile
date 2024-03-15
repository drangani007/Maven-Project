FROM openjdk:11-jre-slim
COPY target/my-app-1.0-SNAPSHOT.jar /app/my-app.jar
WORKDIR /app
CMD ["java", "-jar", "my-app-images.jar"]
