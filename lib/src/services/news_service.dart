import 'package:flutter/material.dart';

// Modelos
import 'package:news_app/src/models/news_models.dart';

class NewsService with ChangeNotifier {

  List<Article> encabezados = [];

  NewsService() {

    this.getTopEncabezados();

  }

  getTopEncabezados() {
    print('Cargar encabezados');
  }

}