import 'package:flutter/material.dart';
import 'package:front_end/components/comeback_button.dart';

class RemoveUser extends StatelessWidget {
  const RemoveUser({super.key});

    //método de voltar (integração back)
  void ComeBack(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 102, 52, 116),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 100),
                      //Necessita do 'check'
                      const Icon(
                        Icons.person_search,
                        size: 100,
                        color: Colors.white,
                      ),

                      // Texto principal
                      const SizedBox(height: 40),
                      const Text(
                        'USUÁRIO EXCLUÍDO COM SUCESSO',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 104, 246, 109), 
                          fontSize: 40, 
                          fontFamily: 'FjallaOne',
                          ),
                      ),

                      // Botão de voltar
                      const SizedBox(height: 40),
                      const ComeBackButton(),

                      // Imagem do computador
                      const SizedBox(height: 30),
                      Image.asset(
                        'lib/images/computer_check.png',
                        height: 300,
                      ),
                    ],
                  )
                )
            )
          )
      );
  }
}
