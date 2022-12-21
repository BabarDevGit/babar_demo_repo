import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Main Menu",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const AppHome(
        title: "Main Menu",
      ),
    );
  }
}

class AppHome extends StatefulWidget {
  const AppHome({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int counter = 0;

  void _inc(bool a) {
    setState(() {
      print("asdfadsf");

      counter += a ? (Random().nextInt(90)) : 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Menu"),
      ),
      backgroundColor: Colors.black26,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Click to Add"),
            Text('$counter', style: Theme.of(context).textTheme.headline1),
            ElevatedButton(
                onPressed: () {
                  _inc(true);
                },
                child: Text("Add"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: "Add",
          onPressed: () {
            _inc(false);
          },
          child: const Icon(Icons.add)),
    );
  }
}
