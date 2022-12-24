import 'dart:collection';

import 'package:flutter/material.dart';

void main() {
  runApp(StateProvider());
}

class StateProvider extends StatefulWidget {
  const StateProvider({Key? key}) : super(key: key);

  @override
  State<StateProvider> createState() => _State_StateProvider();
}

class _State_StateProvider extends State<StateProvider> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Catalog"),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: const Center(
          child: Text("Catalog List"),
        ),
      ),
    );
  }
}

// class CartModel extends ChangeNotifier {
//   final List<Item> _items = [];
//
//   UnmodifiableListView<Item> get items => UnmodifiableListView(_items);
//
//   int get totalPrice => _items.length * 42;
//
//   void add(Item item) {
//     _items.add(item);
//     notifyListeners();
//   }
//
//   void removeAll() {
//     _items.clear();
//     notifyListeners();
//   }
// }
//
// class Item {}
