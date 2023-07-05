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
  String language = "";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: MainColors.bg,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 300,
                    height: 240,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: MainColors.primaryColor,
                          blurRadius: 15,
                          spreadRadius: 15.0,
                        ),
                      ],
                      color: MainColors.primaryColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 250,
                          height: 150,
                          child: Center(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: TextField(
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                                controller: myController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Enter Your Name',
                                ),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(20.0),
                              textStyle: const TextStyle(
                                fontSize: 20,
                              )),
                          child: const Text("Start the game"),
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return GameScreen(language: language);
                            }));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(child: const SizedBox(height: 50)),
                SizedBox(
                  height: 200,
                  child: Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: ListView(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // direction: Axis.horizontal,
                        padding: EdgeInsets.all(15),
                        children: [
                          RadioListTile(
                            title: const Text("Deutsch"),
                            value: "de",
                            groupValue: language,
                            onChanged: (value) {
                              setState(() {
                                language = value!;
                              });
                            },
                          ),
                          RadioListTile(
                            title: const Text("English"),
                            autofocus: true,
                            value: "eng",
                            groupValue: language,
                            onChanged: (value) {
                              setState(() {
                                language = value!;
                              });
                            },
                          ),
                          RadioListTile(
                            title: const Text("Türkçe"),
                            value: 'tr',
                            groupValue: language,
                            onChanged: (value) {
                              setState(() {
                                language = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}