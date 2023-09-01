import 'package:flutter/material.dart';

import '../components/user_card.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  // final String name;
  // final String email;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 102, 52, 116),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              //Icone
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Icon(
                  Icons.supervisor_account_rounded,
                  size: 100,
                  color: Color.fromARGB(255, 252, 148, 25),
                ),
              ),
              //Barra de usuarios
              UserCard(
                  userName: "clodoaldo Nascimento",
                  userEmail: "clodoaldo@gmail.com",
                  userImage:
                      'https://img.freepik.com/free-vector/cute-cool-baby-holding-teddy-bear-doll-cartoon-vector-icon-illustration-people-holiday-isolated_138676-5356.jpg?w=2000'),
              UserCard(
                  userName: "pinguco",
                  userEmail: "pinguin@gmail.com",
                  userImage:
                  'https://static.wikia.nocookie.net/clubpenguin/images/7/75/Blue_from_a_Player_Card.PNG/revision/latest/scale-to-width-down/1200?cb=20140825075945'),
            ],
          ),
        ),
      ),
    );
  }
}
