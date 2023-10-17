import 'package:flutter/material.dart';
import 'package:front_end/pages/user_list.dart';

import '../data/user_inherited.dart';

class RegisterButton extends StatelessWidget {
  final userName, userEmail, userImage;
  const RegisterButton({super.key, required this.userName, required this.userEmail, required this.userImage});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Usuario cadastrado com sucesso"),),);
        Navigator.push(context, MaterialPageRoute(builder: (context) => const UsersList()));
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
