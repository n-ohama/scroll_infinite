import 'package:flutter/material.dart';
import 'package:scroll_infinite/screens/character_list_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Infinite Scroll Pagination Sample',
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    home: const CharacterListScreen(),
  );
}