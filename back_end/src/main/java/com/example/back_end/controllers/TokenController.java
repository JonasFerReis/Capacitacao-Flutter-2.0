/* 
package com.example.back_end.controllers;

import java.util.UUID;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.token.KeyBasedPersistenceTokenService;
import org.springframework.security.core.token.Token;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@RestController
public class TokenController {

    private final KeyBasedPersistenceTokenService tokenService;
    private final EmailSender emailSender; // Alterado para usar a classe EmailSender corretamente

    public TokenController(KeyBasedPersistenceTokenService tokenService, EmailSender emailSender) {
        this.tokenService = tokenService;
        this.emailSender = emailSender;
    }

    @GetMapping("/tokens")
    public String createToken(String userEmail) {
        try {
            // Verificar se o email é válido e está associado a uma conta
            if (isValidEmail(userEmail) && isEmailAssociatedWithAccount(userEmail)) {
                // Gerar um token seguro usando UUID
                String tokenValue = UUID.randomUUID().toString();

            

                // Armazenar o token no serviço de tokens
                Token token = tokenService.allocateToken(tokenValue);

                // Enviar o token por email
                emailSender.sendEmail(userEmail, "Token de Recuperação de Senha", "Seu token de recuperação de senha é: " + token);

                return "Token gerado com sucesso e enviado por email.";
            } else {
                return "Endereço de email inválido ou não associado a uma conta.";
            }
        } catch (Exception e) {
            return "Erro ao gerar token: " + e.getMessage();
        }
    }

    private boolean isValidEmail(String email) {
        // Implemente a validação de endereço de email
        // Retorna true se o email for válido, caso contrário, retorna false
        // Por exemplo, você pode usar uma expressão regular para validação
        return email.matches("^[A-Za-z0-9+_.-]+@(.+)$");
    }

    private boolean isEmailAssociatedWithAccount(String email) {
        
        return true; // Exemplo de retorno verdadeiro para fins de demonstração
    }


    @ExceptionHandler(Exception.class)
    public String handleException(Exception e) {
        // Lida com exceções do tipo Exception
        return "Erro inesperado: " + e.getMessage();
    }
}

@Component
class EmailSender {

    private final JavaMailSender emailSender;

    @Autowired
    public EmailSender(JavaMailSender emailSender) {
        this.emailSender = emailSender;
    }

    public void sendEmail(String to, String subject, String text) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(subject);
        message.setText(text);
        emailSender.send(message);
    }
}
*/