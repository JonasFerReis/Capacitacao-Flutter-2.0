import 'package:flutter/material.dart';
import 'package:front_end/components/my_textfield.dart';
import 'package:front_end/pages/user_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../components/register_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final nameController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 102, 52, 116),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                //icone com espaçamento em cima e em baixo
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Icon(
                    Icons.person_outline,
                    size: 100,
                    color: Color.fromARGB(255, 255, 252, 252),
                  ),
                ),

                //Email TextField
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 15),

                //Username TextField
                MyTextField(
                  controller: nameController,
                  hintText: 'Nome',
                  obscureText: false,
                ),

                const SizedBox(height: 15),

                //Password TextField
                MyTextField(
                  controller: passwordController,
                  hintText: 'Senha',
                  obscureText: true,
                ),

                const SizedBox(height: 15),

                //Confirm Password TextField
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Senha',
                  obscureText: true,
                ),

                const SizedBox(height: 15),

                //Botão "Entrar"
                 RegisterButton(
                  onPressed: () {

                    //cadastra usuario no banco
                    http.post(
                      Uri.parse('http://10.0.2.2:8080/users'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode({
                        "name": nameController.text,
                        "email": emailController.text,
                        "password": passwordController.text,
                      }),
                    );

                    //redireciona para a tela de listagem de usuarios
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const UsersList()));
                  },
                 ),

                Image.asset(
                  'lib/images/pc_com_chip_1.png',
                  height: 300,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
