FROM maven:3.9-eclipse-temurin-17-alpine AS build
ADD https://github.com/spring-projects/spring-petclinic.git /app
WORKDIR /app
RUN mvn package

FROM eclipse-temurin:17-jre-alpine
LABEL author="vaishak"
LABEL name="spc test"
RUN adduser -D -h /usr/share/spc -s /bin/bash alice
USER alice
WORKDIR /usr/share/spc
COPY --from=build /app/target/spring-petclinic-4.0.0-SNAPSHOT.jar /spring-petclinic-4.0.0-SNAPSHOT.jar
EXPOSE 8080/tcp
CMD ["java", "-jar", "/spring-petclinic-4.0.0-SNAPSHOT.jar"]

