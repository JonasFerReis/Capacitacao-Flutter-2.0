import 'package:flutter/material.dart';
import 'package:front_end/data/user_inherited.dart';

import '../components/user_card.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
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
                  children: UserInherited.of(context).usList,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
