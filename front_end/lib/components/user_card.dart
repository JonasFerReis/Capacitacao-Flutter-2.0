import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:front_end/pages/remove_user.dart';

class UserCard extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String userImage;

  const UserCard(
      {super.key,
      required this.userName,
      required this.userEmail,
      required this.userImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Slidable(
          //acoes para quando puxar a barrinha
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: ((context) {
                  //editar
                }),
                icon: Icons.edit,
                backgroundColor: const Color.fromARGB(255, 242, 124, 58),
              ),
              SlidableAction(
                onPressed: ((context) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const RemoveUser()));
                }),
                icon: Icons.delete,
                backgroundColor: Colors.red,
              ),
            ],
          ),

          //barra em si
          child: Container(
            width: 350,
            height: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromARGB(255, 248, 246, 246),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Icone do usuario em formato Circular
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromARGB(255, 242, 124, 58),
                        // Cor da borda
                        width: 2.0, // Largura da borda
                      ),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        userImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                //Nome e Email do usuario
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                          fontSize: 18.0,
                          color: Color.fromARGB(255, 242, 124, 58)),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      userEmail,
                      style: const TextStyle(
                          fontSize: 18.0,
                          color: Color.fromARGB(255, 242, 124, 58)),
                    ),
                  ],
                ),

                //Seta puxando as opcoes
                const Icon(Icons.arrow_back,
                    size: 40, color: Color.fromARGB(255, 242, 124, 58)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
