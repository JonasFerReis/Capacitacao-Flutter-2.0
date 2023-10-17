import 'package:flutter/material.dart';
import 'package:front_end/pages/login.dart';
import 'package:front_end/pages/register_page.dart';

class InitialButton extends StatelessWidget {
  final String buttonText;

  const InitialButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              buttonText == 'Register'
                  ? MaterialPageRoute(
                      builder: (context) => const RegisterPage())
                  : MaterialPageRoute(builder: (context) => LoginPage()));
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.grey.shade400; // Cor quando pressionado
              }
              return const Color.fromARGB(255, 248, 246, 246); // Cor padrão
            },
          ),
          minimumSize: MaterialStateProperty.all<Size>(const Size(300, 60)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          ),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 242, 124, 58),
          ),
        ),
      ),
    );
  }
}
