import 'package:flutter/material.dart';

// Pages
import 'package:news_app/src/pages/tabs_page.dart';

// Services
import 'package:news_app/src/services/news_service.dart';

// Themes
import 'package:news_app/src/theme/tema.dart';

// Paquete dependencia provider
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new NewsService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // Tema
        theme: miTema,
        title: 'Material App',
        home: TabsPage(),
       
      ),
    );
  }
}