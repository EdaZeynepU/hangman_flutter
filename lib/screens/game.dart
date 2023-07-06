import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hhangman/screens/entry.dart';
import '../constants/colors.dart';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lifeProvider = StateProvider((ref) => 5);

class GameScreen extends StatefulWidget {
  final String language;
  final String name;

  const GameScreen({Key? key, required this.language, required this.name}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int life = 5;
  late String word;
  late List<String> chosen_alphabet;
  Set<String> word_alphabet = {};

  List<String> english_words = ["hello", "goodbye", "why"];
  List<String> german_words = ["hallo", "tschüss", "warum"];
  List<String> turkish_words = ["merhaba", "hoşçakal", "neden"];
  List<String> german_alphabet = [
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z",
    "ä",
    "ö",
    "ü",
    "ß"
  ];
  List<String> english_alphabet = [
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z"
  ];
  List<String> turkish_alphabet = [
    "a",
    "b",
    "c",
    "ç",
    "d",
    "e",
    "f",
    "g",
    "ğ",
    "h",
    "ı",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "ö",
    "p",
    "r",
    "s",
    "ş",
    "t",
    "u",
    "ü",
    "v",
    "y",
    "z"
  ];
  // List<String> used_alphabet=[];

  @override
  void initState() {
    // TODO: implement initState
    if (widget.language == 'de') {
      chosen_alphabet = List<String>.from(german_alphabet);
      word = german_words[Random().nextInt(german_words.length)];
    } else if (widget.language == 'eng') {
      chosen_alphabet = List<String>.from(english_alphabet);
      word = english_words[Random().nextInt(german_words.length)];
    } else if (widget.language == 'tr') {
      chosen_alphabet = List<String>.from(turkish_alphabet);
      word = turkish_words[Random().nextInt(german_words.length)];
    }
    for (int i = 0; i < word.length; i++) {
      word_alphabet.add(word[i]);
      print(word[i]);
    }
    super.initState();
  }

  void decreaseLife() {
    setState(() {
      life--;
    });
    if (life <= 0) {
      endOfGameDialog(context, false);
    }
    ;
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) {
    //   return GameOver();
    // }));
  }

  void resetGame() {
    setState(() {
      life = 5;
      if (widget.language == 'de') {
        chosen_alphabet = List<String>.from(german_alphabet);
        word = german_words[Random().nextInt(german_words.length)];
      } else if (widget.language == 'eng') {
        chosen_alphabet = List<String>.from(english_alphabet);
        word = english_words[Random().nextInt(german_words.length)];
      } else if (widget.language == 'tr') {
        chosen_alphabet = List<String>.from(turkish_alphabet);
        word = turkish_words[Random().nextInt(german_words.length)];
      }
      for (int i = 0; i < word.length; i++) {
        word_alphabet.add(word[i]);
        print(word[i]);
      }
    });
  }

  // final lifeStateProvider = StateProvider((ref) => 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.primaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    MainColors.safeColor,
                    MainColors.dangerColor,
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.5, 0.0),
                  stops: [0.1, 0.8],
                )),
                child: Flex(direction: Axis.horizontal, children: [
                  for (int i = 5; 1 <= i; i--)
                    i > life
                        ? const Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.face_retouching_off,
                              size: 50,
                            ))
                        : const Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.face_retouching_natural,
                              size: 50,
                            )),
                ]),
              ),
              // Consumer(
              //     builder: (context, WidgetRef ref, child) {
              //   final life = ref.watch(lifeProvider);
              //   return Text(
              //     ' ',
              //   );
              // }),
              Expanded(
                  flex: 3,
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < word.length; i++)
                        Container(
                          width: 35,
                          height: 45,
                          margin: const EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              chosen_alphabet.contains(word[i]) ? "" : word[i],
                              style: const TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                    ],
                  )),
              Expanded(
                flex: 6,
                child: GridView.builder(
                    itemCount: chosen_alphabet.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          if (0 < life && word_alphabet.isNotEmpty) {
                            String value = chosen_alphabet[index];
                            if (!word.contains(value)) {
                              setState(() {
                                decreaseLife();
                              });
                            } else {
                              word_alphabet.remove(value);
                              print(word_alphabet);
                            }
                            setState(() {
                              chosen_alphabet.remove(value);
                            });
                            if (word_alphabet.isEmpty) {
                              endOfGameDialog(context, true);
                            }
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: MainColors.secondaryColor,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 3, color: MainColors.primaryColor),
                          ),
                          child: Center(
                              child: Text(
                            "${chosen_alphabet[index]}",
                            style: const TextStyle(fontSize: 25),
                          )),
                        ),
                      );
                    }),
              ),
              ElevatedButton(
                onPressed: () {
                  resetGame();
                  Consumer(builder: (context, WidgetRef ref, child) {
                    final life = ref.refresh(lifeProvider);
                    return Text(
                      '${life}',
                    );
                  });
                },
                child: Text('Reset Game'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> endOfGameDialog(BuildContext context, bool isWinner) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: isWinner
                ? Text("You winnnn ${widget.name}! the word is \"${word}\"")
                : Text('Ops you lost.. The word is \"${word}\" :/'),
            content: isWinner
                ? Text("Wanna play again?")
                : Text("Wanna try again :')?"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'restart');
                  resetGame();
                },
                child: const Text('Play Again'),
              ),
              TextButton(
                onPressed: () => {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Entry();
                  })),
                },
                child: const Text('Main Page'),
              ),
            ],
          );
        });
  }
}
