package com.example.back_end.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.back_end.models.User;
import com.example.back_end.repository.UserRepository;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


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

    // Método editar Usuário
    // Passar nome, email ou senha ( ou todos ) no body de sua requisição
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public User atualizarUsuario(@RequestBody User dadosNovos, @PathVariable("id") Long id){
        User usuario = userRepository.findById(id).get();
        if (dadosNovos.getName() != null){
            usuario.setName(dadosNovos.getName());
        }
        if (dadosNovos.getEmail() != null){
            usuario.setEmail(dadosNovos.getEmail());
        }

        if (dadosNovos.getPassword() != null){
            usuario.setPassword(dadosNovos.getPassword());
        }
        userRepository.save(usuario);

        return usuario;
    }
    
}
