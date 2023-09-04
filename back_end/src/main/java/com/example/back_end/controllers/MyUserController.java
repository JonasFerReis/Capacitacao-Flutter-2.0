package com.example.back_end.controllers;

import java.util.Collections;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.back_end.models.User;
import com.example.back_end.repository.UserRepository;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
@RequestMapping("/users")
public class MyUserController {
    private final UserRepository userRepository;

    public MyUserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    /**
     * @return
     */
    @GetMapping
public ResponseEntity<List<User>> getAllUsers() {
    try {
        List<User> users = userRepository.findAll();

        for (User user : users) {
            user.setPassword("");
        }
        return ResponseEntity.ok(users);
    } catch (Exception e) {
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Collections.singletonList(new User("Ocorreu um erro ao buscar usuários")));
    }
}
}
