import 'package:flutter/material.dart';

class RemoveUser extends StatelessWidget {
  const RemoveUser({super.key});

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

                      const SizedBox(height: 40),
                      const Text(
                        'USUÁRIO EXCLUÍDO COM SUCESSO',
                        style: TextStyle(
                          color: Colors.green, 
                          fontSize: 40, 
                          
                          ),
                      ),

                      Container(
                        width: 200.0, // Largura do container
                        height: 200.0, // Altura do container
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/computer_check.png'), // Caminho da imagem
                            fit: BoxFit.cover, // Ajuste da imagem
                          ),
                        ),
                      ),
                    ],
                  )
                )
            )
          )
      );
  }
}
