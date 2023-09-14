import 'package:flutter/material.dart';
import 'package:front_end/components/user_card.dart';

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
