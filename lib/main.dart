import 'package:flutter/material.dart';

// Pages
import 'package:news_app/src/pages/tabs_page.dart';

// Themes
import 'package:news_app/src/theme/tema.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Tema
      theme: miTema,
      title: 'Material App',
      home: TabsPage(),
     
    );
  }
}