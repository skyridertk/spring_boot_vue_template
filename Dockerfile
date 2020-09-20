FROM openjdk:8-jre-alpine

ENV APPLICATION_USER springboot
RUN adduser -D -g '' $APPLICATION_USER

RUN mkdir /app
RUN chown -R $APPLICATION_USER /app

USER $APPLICATION_USER

COPY ./build/libs/spring_vue_2-0.0.1-SNAPSHOT.jar /app/spring_vue_2-0.0.1-SNAPSHOT.jar
WORKDIR /app

CMD ["java", "-server", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-XX:InitialRAMFraction=2", "-XX:MinRAMFraction=2", "-XX:MaxRAMFraction=2", "-XX:+UseG1GC", "-XX:MaxGCPauseMillis=100", "-XX:+UseStringDeduplication", "-jar", "spring_vue_2-0.0.1-SNAPSHOT.jar"]