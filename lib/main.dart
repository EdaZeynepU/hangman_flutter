import 'package:flutter/material.dart';
import 'package:hhangman/screens/game.dart';
import 'screens/entry.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    //   home: Scaffold(
    //     appBar: PreferredSize(
    //       preferredSize: Size.fromHeight(66),
    //   child: Padding(
    //     padding: const EdgeInsets.fromLTRB(0, 10, 7, 0),
    //     child: AppBar(
    //
    //       title: Text(
    //         'Hangman',
    //
    //       ),
    //       elevation: 0,
    //       backgroundColor: Colors.transparent, // appbar color.
    //       actions: [
    //         TextButton(onPressed: (){}, child: Text(
    //           'in many language',
    //
    //         ),),
    //
    //       ],
    //     ),
    //
    //   ),
    // ),
          home: Entry()

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "hi",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
