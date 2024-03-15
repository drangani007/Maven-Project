FROM openjdk:11-jre-slim
COPY target/my-app-image-SNAPSHOT.jar /app/my-app.jar
WORKDIR /app
CMD ["java", "-jar", "my-app-image.jar"]
