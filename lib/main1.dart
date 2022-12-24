import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const App(title: "asdfdsaf"));
}

class App extends StatelessWidget {
  const App({Key? key, title}) : super(key: key);

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
      counter += a ? (Random().nextInt(90)) : 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final headline = Theme.of(context).textTheme.headline6;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                child: Text("Add")),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  Text(
                    'Flutter is designed to use composition '
                    'rather than inheritance, and a great way '
                    'to see it in action is in build methods.',
                    style: headline,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Instead of having every Widget inherit '
                    'from a base class with all the necessary '
                    'properties (like padding), Flutter uses '
                    'individual classes.',
                    style: headline,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Padding, for example, knows how to pad '
                    'a child... and nothing else! ',
                    style: headline,
                  ),
                  const Divider(),
                ],
              ),
            )
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
