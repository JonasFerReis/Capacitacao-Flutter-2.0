import 'package:flutter/material.dart';
import '../components/user_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  // Lista de usuários
  List<UserCard> usList = [];

  // Função que pega os dados do banco de dados e adiciona na lista
  void getUsers() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/users'));
    final data = jsonDecode(response.body);
    usList.clear(); // Limpa a lista para não duplicar os usuários
    for (var i = 0; i < data.length; i++) {
      usList.add(UserCard(
        id: data[i]['id'],
        userName: data[i]['name'],
        userEmail: data[i]['email'],
        userImage:
        'https://w7.pngwing.com/pngs/851/512/png-transparent-looking-at-the-cat-hand-painted-pet-cat.png',
        onDelete: (id) {
          setState(() {
            usList.removeWhere((UserCard) => UserCard.id == id);
          });
        }
      ));
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 102, 52, 116),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // Ícone
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Icon(
                  Icons.supervisor_account_rounded,
                  size: 100,
                  color: Color.fromARGB(255, 252, 148, 25),
                ),
              ),
              // Sua ListView
              Expanded(
                child: ListView.builder(
                  itemCount: usList.length,
                  itemBuilder: (context, index) {
                    return usList[index];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
