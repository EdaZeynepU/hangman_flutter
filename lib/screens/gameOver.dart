import 'package:flutter/material.dart';

class GameOver extends StatelessWidget {
  const GameOver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Game Over",
        style: TextStyle(fontSize: 50),)
      ],
    );
  }
}
