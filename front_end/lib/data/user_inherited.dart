import 'package:flutter/material.dart';
import 'package:front_end/components/user_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserInherited extends InheritedWidget {
  UserInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<UserCard> usList = [
    const UserCard(
        userName: "clodoaldo",
        userEmail: "clodoaldo@gmail.com",
        userImage:
            'https://img.freepik.com/free-vector/cute-cool-baby-holding-teddy-bear-doll-cartoon-vector-icon-illustration-people-holiday-isolated_138676-5356.jpg?w=2000'),
    const UserCard(
        userName: "pinguco",
        userEmail: "pinguin@gmail.com",
        userImage:
            'https://static.wikia.nocookie.net/clubpenguin/images/7/75/Blue_from_a_Player_Card.PNG/revision/latest/scale-to-width-down/1200?cb=20140825075945'),
  ];

  void newUser(String userName, String userEmail, userImage){
    usList.add(UserCard(userName: userName, userEmail: userEmail, userImage: userImage));
  }

  //funcao que pega os dados do banco de dados e adiciona na lista
  void getUsers() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/users'));
    final data = jsonDecode(response.body);
    for (var i = 0; i < data.length; i++) {
      print (data[i]['name']);
      print (data[i]['email']);
      usList.add(UserCard(
          userName: data[i]['name'],
          userEmail: data[i]['email'],
          userImage: data[i]['https://w7.pngwing.com/pngs/851/512/png-transparent-looking-at-the-cat-hand-painted-pet-cat.png']));
    }
  }

  static UserInherited of(BuildContext context) {
    final UserInherited? result =
        context.dependOnInheritedWidgetOfExactType<UserInherited>();
    assert(result != null, 'No UserInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(UserInherited old) {
    return old.usList.length != usList.length;
  }
}
