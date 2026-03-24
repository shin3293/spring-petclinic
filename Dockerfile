FROM eclipse-temurin:21-jre-alpine
ARG JAR_FILE_PATH=target/*.jar
COPY ${JAR_FILE_PATH} spring-petcilnic.jar
ENTRYPOINT ["java", "-jar", "spring-petclinic.jar"]
