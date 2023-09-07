import 'package:flutter/material.dart';
import 'package:front_end/data/user_inherited.dart';
import 'package:front_end/pages/initial_screen.dart';
import 'package:front_end/pages/remove_user.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  UserInherited(
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RemoveUser(),
      ),
    );
  }
}

