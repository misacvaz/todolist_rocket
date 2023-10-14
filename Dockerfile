FROM ubuntu:latest As build

RUN apt-get update
RUN apt-get install openjdk-17-jdk -y

COPY . .

RUN apt-get install maven -y
RUN mvm  clean install

FROM openjdk:17-jdk-slim

EXPOSE 8080

COPY --from=build /target/todolist-1.0.0.jar app.jar 

ENTRYPIONT ["java", "-jar", "app.jar"]

