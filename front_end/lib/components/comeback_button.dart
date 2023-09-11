import 'package:flutter/material.dart';

class ComeBackButton extends StatelessWidget{
  
  final Function()? onTap;

  const ComeBackButton({
    super.key,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 110),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(8),
          ),
        child: const Center(
          child: Text(
            "Voltar",
            style: TextStyle(color: Colors.white),
            )
          ), 
      ),
    );
  }
}