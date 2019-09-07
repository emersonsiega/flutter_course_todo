import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(TODOApp());

class TODOApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale("pt", "BR"),
      theme: ThemeData(
        primaryColor: Color(0xffBC5A5A),
        accentColor: Color(0xffBC5A5A),
        brightness: Brightness.dark,
        backgroundColor: Color(0xff5E5E5E),
        inputDecorationTheme: InputDecorationTheme( 
          border: InputBorder.none,
        )
      ),
      home: Home(),
    );
  }
}
