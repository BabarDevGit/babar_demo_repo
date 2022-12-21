import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
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
            Text('$counter', style: Theme.of(context).textTheme.headline1)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: "Add",
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          child: const Icon(Icons.add)),
    );
  }
}
