FROM maven:3.9.10-eclipse-temurin-21 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

FROM tomcat:10.1-jdk21-temurin

RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY --from=build /app/target/food.war /usr/local/tomcat/webapps/food.war

CMD ["sh", "-c", "sed -i \"s/port=\\\"8080\\\"/port=\\\"${PORT:-8080}\\\"/\" /usr/local/tomcat/conf/server.xml && catalina.sh run"]