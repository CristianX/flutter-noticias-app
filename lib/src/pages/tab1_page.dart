import 'package:flutter/material.dart';

// Service
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/widgets/lista_noticias.dart';

// Dependencia paquete provider
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    // newsService.encabezados;


    return Scaffold(

      body: ListaNoticias( newsService.encabezados ),
      
    );
  }
}