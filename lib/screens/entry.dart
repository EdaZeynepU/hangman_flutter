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
  String language = "eng";
  String name = "";
  final _formKey = GlobalKey<FormState>();

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
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        width: 300,
                        height: 440,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: MainColors.secondaryColor,
                              blurRadius: 15,
                              spreadRadius: 15.0,
                            ),
                          ],
                          color: MainColors.secondaryColor,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: 'Please enter your name',
                                        labelText: 'Name *',
                                        hintStyle: TextStyle(fontSize: 25),
                                        labelStyle: TextStyle(fontSize: 25),
                                        contentPadding: EdgeInsets.only(
                                            left: 20, right: 20),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        name = value;
                                        return null;
                                      },
                                    ),

                                    SizedBox(child: const SizedBox(height: 20)),
                                    Container(
                                      height: 200,
                                      child: Center(
                                        child: Container(
                                          child: ListView(
                                            padding: EdgeInsets.all(15),
                                            children: <Widget>[
                                              RadioListTile<String>(
                                                title: const Text(
                                                  "Deutsch",
                                                  style:
                                                      TextStyle(fontSize: 25),
                                                ),
                                                value: "de",
                                                groupValue: language,
                                                onChanged: (value) {
                                                  setState(() {
                                                    language = value!;
                                                  });
                                                },
                                              ),
                                              RadioListTile<String>(
                                                title: const Text("English",
                                                    style: TextStyle(
                                                        fontSize: 25)),
                                                value: "eng",
                                                groupValue: language,
                                                onChanged: (value) {
                                                  setState(() {
                                                    language = value!;
                                                  });
                                                },
                                              ),
                                              RadioListTile<String>(
                                                title: const Text("Türkçe",
                                                    style: TextStyle(
                                                        fontSize: 25)),
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
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.all(20.0),
                                            // textStyle: TextStyle(
                                            //   fontSize: 20,
                                            // )
                                          ),
                                          child: const Text(
                                            "Start the game",
                                            style: TextStyle(
                                              fontSize: 25,
                                            ),
                                          ),
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return GameScreen(
                                                    language: language,
                                                    name: name);
                                              }));
                                            }
                                          }),
                                    ),
                                    //       child: TextField(
                                    //           style: const TextStyle(
                                    //             fontSize: 20,
                                    //           ),
                                    //           // controller: myController,
                                    //           decoration: const InputDecoration(
                                    //             border: OutlineInputBorder(),
                                    //             labelText: 'Enter Your Name',
                                    //           ),
                                    //
                                    //
                                    //
                                    //         // validator: (value) {
                                    //         //   if (value.isEmpty) {
                                    //         //     return 'This field is required';
                                    //         //   }
                                    //         //   return null;
                                    //         // },
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    // SizedBox(
                                    //   height: 20,
                                    // ),

                                    // ElevatedButton(
                                    //   style: ElevatedButton.styleFrom(
                                    //       padding: const EdgeInsets.all(20.0),
                                    //       textStyle: const TextStyle(
                                    //         fontSize: 20,
                                    //       )),
                                    //   child: const Text("Start the game"),
                                    //   onPressed: () {
                                    //     Navigator.of(context)
                                    //         .push(MaterialPageRoute(builder: (context) {
                                    //       return GameScreen(language: language);
                                    //     }));
                                    //   },
                                    // ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
