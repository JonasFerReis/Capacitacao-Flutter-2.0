import 'package:flutter/material.dart';
import 'package:front_end/components/my_textfield.dart';

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
                 RegisterButton(userName: nameController, userEmail: emailController, userImage: 'https://w7.pngwing.com/pngs/851/512/png-transparent-looking-at-the-cat-hand-painted-pet-cat.png'),

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
