import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppBarDemo());
}

class AppBarDemo extends StatefulWidget {
  const AppBarDemo({Key? key}) : super(key: key);

  @override
  State<AppBarDemo> createState() => AppBarDemoState();
}

class AppBarDemoState extends State<AppBarDemo> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  final _saved = <WordPair>{}; // NEW

  @override
  Widget build(BuildContext context) {
    int len = 04;
    return MaterialApp(
      theme:
          // // _buildShrineTheme(),
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.black26),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Text("Dashboard"),
          actions: [
            Icon(Icons.file_upload),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
              ),
            ),
            Icon(Icons.more_vert),
          ],
          // backgroundColor: Colors.purple,
        ),
        body: ListView.builder(
          itemBuilder: (context, i) {
            if (i.isOdd) {
              return const Divider(
                thickness: 1,
              );
            }
            final index = i ~/ 2;
            if (index >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10)); /*4*/
            }
            final alreadySaved = _saved.contains(_suggestions[index]); // NEW

            return ListTile(
              title: Text(
                _suggestions[index].asPascalCase,
                style: _biggerFont,
              ),
              trailing: Icon(
                // NEW from here ...
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                color: alreadySaved ? Colors.red : null,
                semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
              ),
              onTap: () {
                // NEW from here ...
                setState(() {
                  if (alreadySaved) {
                    _saved.remove(_suggestions[index]);
                  } else {
                    _saved.add(_suggestions[index]);
                  }
                }); // to here.
              },
            );
          },
        ),

        // ListView.builder(
        //   itemBuilder: (context, i) {
        //     if (i.isOdd)
        //       return const Divider(
        //         thickness: 1,
        //       );
        //     final index = i ~/ 2;
        //     if (index >= _suggestions.length) {
        //       _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        //       setState(() {
        //         len = _suggestions.length;
        //         print(len);
        //       });
        //     }
        //     return ListTile(
        //       title: Text(
        //         _suggestions[index].asPascalCase,
        //         style: _biggerFont,
        //       ),
        //     );
        //   },
        // ),

        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              IconButton(icon: Icon(Icons.menu), onPressed: () {}),
              Spacer(),
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
              IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            onPressed: () {}),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
      debugShowCheckedModeBanner: false,
    );
    ;
  }
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: shrinePink100,
    buttonColor: shrinePink100,
    scaffoldBackgroundColor: shrineBackgroundWhite,
    cardColor: shrineBackgroundWhite,
    errorColor: shrineErrorRed,
    buttonTheme: const ButtonThemeData(
      colorScheme: _shrineColorScheme,
      textTheme: ButtonTextTheme.normal,
    ),
    primaryIconTheme: _customIconTheme(base.iconTheme),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
    colorScheme: _shrineColorScheme.copyWith(secondary: shrineBrown900),
  );
}

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: shrineBrown900);
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        caption: base.caption?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button?.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: shrineBrown900,
        bodyColor: shrineBrown900,
      );
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink100,
  primaryVariant: shrineBrown900,
  secondary: shrinePink50,
  secondaryVariant: shrineBrown900,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;
