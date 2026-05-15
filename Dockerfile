FROM eclipse-temurin:21-jdk-jammy As test

WORKDIR /app

COPY . .

RUN chmod +x mvnw

RUN ./mvnw test -B



FROM eclipse-temurin:21-jdk-jammy As compile 

WORKDIR /app

COPY --from=test /app .

RUN ./mvnw clean package -DskipTest


FROM alpine/java:21-jdk AS prod

COPY --from=compile /app/target/*.jar /app.jar

CMD ["java", "-jar", "/app.jar"]

