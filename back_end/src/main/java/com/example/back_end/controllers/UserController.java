package com.example.back_end.controllers;

import org.hibernate.mapping.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.example.back_end.models.User;
import com.example.back_end.repository.UserRepository;

import java.util.Optional;

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
    public ResponseEntity<?> cadastrarUsuario(@RequestBody User user){
        if (userRepository.findByEmail(user.getEmail()) == null){
            User usuario = userRepository.save(user);
            return ResponseEntity.status(HttpStatus.CREATED).body(usuario);
        }
        else{
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Já existe um usário cadastrado com esse email");
        }
    }

    // Método editar Usuário
    // Passar nome, email ou senha ( ou todos ) no body de sua requisição
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<?> editarUsuario(@RequestBody User dadosNovos, @PathVariable("id") Long id){

        Optional<User> usuario = userRepository.findById(id);
        if (!usuario.isPresent()){
            return ResponseEntity.badRequest().body("Usuário não encontrado");
        }

        User usuarioEncontrado = usuario.get();

        User usuarioAtualizado = atualizarUser(usuarioEncontrado, dadosNovos);

        userRepository.save(usuarioAtualizado);

        return ResponseEntity.status(HttpStatus.OK).body(usuario);
    }

    
    
    public User atualizarUser(User antigoUser, User novoUser){
        if (novoUser.getName() != null){
            antigoUser.setName(novoUser.getName());
        }
        if (novoUser.getEmail() != null){
            antigoUser.setEmail(novoUser.getEmail());
        }
        if (novoUser.getPassword() != null){
            antigoUser.setPassword(novoUser.getPassword());
        }
        return antigoUser;
    }
}
