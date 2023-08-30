package com.example.back_end.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.back_end.models.User;
import com.example.back_end.repository.UserRepository;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.security.crypto.keygen.BytesKeyGenerator;
import org.springframework.security.crypto.keygen.KeyGenerators;


@RestController
@RequestMapping("/users")
public class UserController {
    
    private final UserRepository userRepository;

    @Autowired
    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
       
       
    }

    @PostMapping
    public ResponseEntity<User> cadastrarUsuario(@RequestBody User user){
        System.out.println(user.getName());
        if (userRepository.findByEmail(user.getEmail()) == null){
            User usuario = userRepository.save(user);
            return ResponseEntity.status(HttpStatus.CREATED).body(usuario);
        }
        else{
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }
    }
  
    @GetMapping("/{id}")
    public ResponseEntity<User> recuperarUsuario(@PathVariable Long id) {
        User user = userRepository.findById(id).orElse(null);
        if (user != null) {
            return ResponseEntity.ok(user);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping("/reset-password")
public ResponseEntity<Void> resetPassword(@RequestBody String email) {
    User user = userRepository.findByEmail(email);
    if (user != null) {
        BytesKeyGenerator keyGenerator = KeyGenerators.secureRandom(32);
        String token = keyGenerator.generateKey().toString();
        
            return ResponseEntity.ok().build();
    } else {
        return ResponseEntity.notFound().build();
    }


}
}






