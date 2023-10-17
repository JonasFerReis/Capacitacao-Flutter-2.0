import 'package:flutter/material.dart';

class LogoIcon extends StatelessWidget{

  final String imagePath;
  const LogoIcon({
    super.key,
    required this.imagePath,
    });

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(20),
      child: Image.asset(
        imagePath,
        height: 40,
        ),
    );
  }
}