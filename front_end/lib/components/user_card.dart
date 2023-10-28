import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:front_end/pages/remove_user.dart';
import 'package:front_end/pages/update_page.dart';
import 'package:http/http.dart' as http;

class UserCard extends StatefulWidget {
  final id;
  String userName;
  String userEmail;
  String userImage;
  final Function(int) onDelete; // Função de callback

   UserCard(
      {super.key,
      required this.id,
      required this.userName,
      required this.userEmail,
      required this.userImage,
      required this.onDelete});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
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
                onPressed: ((context) async {
                  //editar
                  var response = {
                    'id': widget.id,
                    'name': widget.userName,
                    'email': widget.userEmail,
                    'image': widget.userImage
                  };
                  //dicionario que recebe o retorno da pagina de edicao de usuario
                  var dicionario = await Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePage(id: widget.id)));
                  if(dicionario != null){
                    setState(() {
                      widget.userName = dicionario['name'];
                      widget.userEmail = dicionario['email'];
                      widget.userImage = 'https://w7.pngwing.com/pngs/851/512/png-transparent-looking-at-the-cat-hand-painted-pet-cat.png';
                    });
                  }
                }),
                icon: Icons.edit,
                backgroundColor: const Color.fromARGB(255, 242, 124, 58),
              ),
              SlidableAction(
                onPressed: ((context) async {

                  //deletar usuario
                  final response = await http.delete(Uri.parse('http://10.0.2.2:8080/users/${widget.id}'));
                  if(response.statusCode == 200){
                    widget.onDelete(widget.id);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RemoveUser()));
                  }
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
                        widget.userImage,
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
                      widget.userName,
                      style: const TextStyle(
                          fontSize: 18.0,
                          color: Color.fromARGB(255, 242, 124, 58)),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.userEmail,
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
