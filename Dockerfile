FROM eclipse-temurin:17-jre-alpine
LABEL author="vaishak"
LABEL name="spc test"
RUN adduser -D -h /usr/share/spc -s /bin/bash alice
USER alice
WORKDIR /usr/share/spc
ADD /target/spring-petclinic-4.0.0-SNAPSHOT.jar /spring-petclinic-4.0.0-SNAPSHOT.jar
EXPOSE 8080/tcp
CMD ["java", "-jar", "/spring-petclinic-4.0.0-SNAPSHOT.jar"]

