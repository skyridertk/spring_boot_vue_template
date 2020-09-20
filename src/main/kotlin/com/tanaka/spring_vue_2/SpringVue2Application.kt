package com.tanaka.spring_vue_2

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController


@SpringBootApplication
class SpringVue2Application

fun main(args: Array<String>) {
    runApplication<SpringVue2Application>(*args)
}

@Controller
class HomeContoller {
    @RequestMapping("/")
    fun index(): String {
        return "index.html"
    }
}

@RestController
class AnotherConstoller {
    @RequestMapping("/api")
    fun index(): String {
        return "Hello"
    }
}