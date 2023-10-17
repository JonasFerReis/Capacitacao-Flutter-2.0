package com.example.back_end.controllers;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


import com.example.back_end.models.User;
import com.example.back_end.repository.UserRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.DeleteMapping;


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
    public ResponseEntity<?> getAllUsers() {
        try {
            List<User> users = userRepository.findAll();

            for (User user : users) {
                user.setPassword("");
            }
            return ResponseEntity.ok(users);
        } catch (Exception e) {
            // return ResponseEntity.ok(Collections.singletonList(new User("Ocorreu um erro ao buscar usuários")));
            return ResponseEntity.badRequest().body("TESTE");
        }
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<?> getUser(@PathVariable("id") Long id){
        Optional<User> usuario = userRepository.findById(id);
        if(usuario.isPresent()){
            return ResponseEntity.status(HttpStatus.OK).body(usuario.get());
        }
        return ResponseEntity.badRequest().body("Usuário não encontrado");
    }
    @DeleteMapping("/{id}")
public ResponseEntity<?> deleteUser(@PathVariable("id") Long id) {
    Optional<User> usuario = userRepository.findById(id);
    if(usuario.isPresent()){
        userRepository.delete(usuario.get());
        return ResponseEntity.status(HttpStatus.OK).body("Usuário deletado com sucesso");
    }
    return ResponseEntity.badRequest().body("Usuário não encontrado");
}
}