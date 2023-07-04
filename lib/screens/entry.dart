// import 'dart:async';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../screens/game.dart';

class Entry extends StatefulWidget {
  const Entry({Key? key}) : super(key: key);

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.primaryColor,
      body: Align(

        alignment: Alignment.center,
        child: SafeArea(
          top: true,
          child: Container(

            width: 300,
            height: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MainColors.secondaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  height: 250,
                  child: Center(
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      controller: myController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text("Start the game"),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return GameScreen();
                    }));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
