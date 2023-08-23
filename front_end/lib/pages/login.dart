import 'package:flutter/material.dart';
import 'package:front_end/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  //construtor personalizado
  LoginPage({super.key});

  // editando controladores de texto
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    //rever o pq do const no Scalffold dps
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [

              const SizedBox(height: 100),
              //ícone de usuário
              const Icon(
                Icons.person_outline,
                size: 100,
                color: Colors.white,
              ),

              const SizedBox(height: 25),
              //email
              MyTextField(
                controller: usernameController,
                hintText: 'E-mail',
                obscureText: false,
              ),

              const SizedBox(height: 25),
              //senha
              MyTextField(
                controller: passwordController,
                hintText: 'Senha',
                obscureText: true,
              ),

              const SizedBox(height: 10),
              //lembrar senha
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Lembrar Senha',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              //esqueceu a senha
              const Text(
                'Esqueceu a Senha?',
                style: TextStyle(color: Colors.white),
              ),

              const SizedBox(height: 25),
              //botão de entrar

              //ou continue com

              //ícones do google, facebook e apple

              //ícone da emakers

            ],
          ),
        ),
      ),
    );
  }
}