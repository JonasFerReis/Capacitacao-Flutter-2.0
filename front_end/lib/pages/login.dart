import 'package:flutter/material.dart';
import 'package:front_end/components/login_button.dart';
import 'package:front_end/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  //construtor personalizado
  LoginPage({super.key});

  // editando controladores de texto
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //método de login (integração back)
  void SignIn(){

  }

  @override
  Widget build(BuildContext context){
    //rever o pq do const no Scalffold dps
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: SingleChildScrollView(
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
                LoginButton(
                  onTap: SignIn,
                ),
        
                const SizedBox(height: 50),
        
                //ou continue com
                // Divider = cria uma linha
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.white,
                        ),
                      ),
                
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Ou',
                          style: TextStyle(color: Colors.white),
                          ),
                        
                      ),
                
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
        
                //ícones do google, facebook e apple
                Row(
                  children: [
                    Image.asset('lib/images/google.png', height: 72,)
                  ],
                )
                //ícone da emakers
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}