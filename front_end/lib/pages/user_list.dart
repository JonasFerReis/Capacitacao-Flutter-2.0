import 'package:flutter/material.dart';
import 'package:front_end/data/user_inherited.dart';

import '../components/user_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {

  //lista de usuarios
  List<UserCard> usList = [];

  //funcao que pega os dados do banco de dados e adiciona na lista
  void getUsers() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/users'));
    final data = jsonDecode(response.body);
    for (var i = 0; i < data.length; i++) {
      print(data[i]['name']);
      print(data[i]['email']);
      usList.add(UserCard(
          userName: data[i]['name'],
          userEmail: data[i]['email'],
          userImage:
              'https://w7.pngwing.com/pngs/851/512/png-transparent-looking-at-the-cat-hand-painted-pet-cat.png'));
    }
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
                  child: ListView(
                    children:usList,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
}

