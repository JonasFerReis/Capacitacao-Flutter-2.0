import 'package:flutter/material.dart';
import 'package:front_end/components/login_button.dart';
import 'package:front_end/components/logo_icon.dart';
import 'package:front_end/components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  //construtor personalizado
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // editando controladores de texto
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  //método de login (integração back)
  void SignIn(){

  }

  bool RememberMe = false;

  @override
  Widget build(BuildContext context){
    //rever o pq do const no Scalffold dps
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 102, 52, 116),
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
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: [
                      Theme(data: ThemeData(unselectedWidgetColor: Colors.white), 
                      child: Checkbox(
                        onChanged: (value){
                          setState(() {
                            RememberMe = !RememberMe;
                          });
                        },
                        value: RememberMe,
                        ),
                      ),
                      const Text(
                        "Lembrar Senha",
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

                const SizedBox(height:70),

                //ícones do google, facebook e apple
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LogoIcon(imagePath: 'lib/images/google.png'),

                    SizedBox(width:25),

                    LogoIcon(imagePath: 'lib/images/facebook.png'),

                    SizedBox(width:25),

                    LogoIcon(imagePath: 'lib/images/apple.png'),
                  ],
                ),
                
                const SizedBox(height: 75),

                //ícone da emakers
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LogoIcon(imagePath: 'lib/images/logo_emakers.png'),
                    SizedBox(width: 1),
                    Text(
                      'emakersjr.com.br',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}