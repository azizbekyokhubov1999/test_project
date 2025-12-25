package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class HelloDevOps {
    public static void main(String[] args) {
        System.out.println("Hello and welcome!");
        for (int i = 1; i <= 5; i++) {
            System.out.println("i = " + i);
        }
        SpringApplication.run(HelloDevOps.class, args);
    }

    @GetMapping("/")
    public String health() {
        return "Application is Healthy!";
    }
}