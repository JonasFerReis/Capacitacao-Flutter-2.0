import 'package:flutter/material.dart';
import 'package:front_end/components/initial_buton.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 102, 52, 116),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50, bottom: 20),
                //Icone
                child: Icon(
                  Icons.person_outline,
                  size: 100,
                  color: Color.fromARGB(255, 255, 252, 252),
                ),
              ),

              //Bem-Vindo
              Padding(
                padding: EdgeInsets.only(bottom: 150),
                child: Text(
                  'Bem-Vindo',
                  style: TextStyle(
                      fontSize: 25, color: Color.fromARGB(255, 248, 246, 246)),
                ),
              ),

              //LoginButton
              InitialButton(buttonText: 'Login',),

              //RegisterButton
              InitialButton(buttonText: 'Register',),


            ],
          ),
        ),
      ),
    );
  }
}
