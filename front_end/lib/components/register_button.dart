import 'package:flutter/material.dart';



class RegisterButton extends StatelessWidget {
  final Function onPressed;
  const RegisterButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return const Color.fromARGB(
                  255, 242, 124, 58); // Cor quando pressionado
            }
            return Colors.orange; // Cor padrão
          },
        ),
        minimumSize: MaterialStateProperty.all<Size>(const Size(200, 60)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
      child: const Text(
        "Registrar-se",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
