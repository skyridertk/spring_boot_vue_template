## Description
Integration of Spring boot and Vue the easy way

 [Heroku App](https://infinite-reef-26326.herokuapp.com)

## Requirements
1. Vue 3.0.0 [We need the built files in `dist`]

2. Springboot 2.4.0-SNAPSHOT

3. Spring Web dependency

## Steps

1. Build `Vue project` and  copy all contents `[VueProject]\dist`  to `[SpringbootProjectLocation]\src\main\resources\static`

2. Add  `Controller`

   ```
       @Controller
        class HomeContoller {
            @RequestMapping("/")
            fun index(): String {
                return "index.html"
            }
        }
   ```



### Run using docker
Create `Dockerfile` in `project root` and use `your_file`.jar (found in `build/libs`)

```
FROM openjdk:8-jre-alpine

ENV APPLICATION_USER springboot
RUN adduser -D -g '' $APPLICATION_USER

RUN mkdir /app
RUN chown -R $APPLICATION_USER /app

USER $APPLICATION_USER

COPY ./build/libs/spring_vue_2-0.0.1-SNAPSHOT.jar /app/spring_vue_2-0.0.1-SNAPSHOT.jar
WORKDIR /app

CMD ["java", "-server", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-XX:InitialRAMFraction=2", "-XX:MinRAMFraction=2", "-XX:MaxRAMFraction=2", "-XX:+UseG1GC", "-XX:MaxGCPauseMillis=100", "-XX:+UseStringDeduplication", "-jar", "spring_vue_2-0.0.1-SNAPSHOT.jar"]
```
##### Steps
1. `gradlew build`
2. `docker build -t spring_vue_app .`
3. `docker run -m512M --cpus 2 -it -p 8080:8090 --rm spring_vue_app`
4. Open `localhost:8080`

### Run using Intellij IDEA Ultimate
1. Run `main` function
2. Open `localhost:8080`


### Deploy to Heroku
1. `heroku login`
2. `heroku container:login`
3. `heroku container:push web -a infinite-reef-26326`
4. `heroku container:release web -a infinite-reef-26326`

[Heroku App](https://infinite-reef-26326.herokuapp.com)



