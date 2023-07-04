import 'dart:async';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.primaryColor,
      body: Column(
        children: [
          Expanded(child: Text(
              "",
          ))
        ],
      ),
    );
  }
}
