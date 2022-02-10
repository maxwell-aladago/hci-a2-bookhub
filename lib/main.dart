import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const BookHub());
}

class BookHub extends StatelessWidget {
  const BookHub({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookHub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
