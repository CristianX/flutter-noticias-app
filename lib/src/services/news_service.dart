import 'package:flutter/material.dart';

// Package font awesome
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Certificados
import 'package:news_app/src/certificate/certificate.dart';

// Modelos
import 'package:news_app/src/models/news_models.dart';
import 'package:news_app/src/models/categoria_model.dart';

// Http
import 'package:http/http.dart' as http;

final _urlNews = 'https://newsapi.org/v2';
final _apiKey = Certificate.apiKey;


class NewsService with ChangeNotifier {


  List<Article> encabezados = [];

  // Listado de categorias
  List<Categoria> categorias = [
    Categoria( FontAwesomeIcons.building, 'business' ),
    Categoria( FontAwesomeIcons.tv, 'entertainment' ),
    Categoria( FontAwesomeIcons.addressCard, 'general' ),
    Categoria( FontAwesomeIcons.headSideVirus, 'health' ),
    Categoria( FontAwesomeIcons.vials, 'science' ),
    Categoria( FontAwesomeIcons.volleyballBall, 'sports' ),
    Categoria( FontAwesomeIcons.memory, 'technology' ), 
  ];

  NewsService() {

    this.getTopEncabezados();

  }

  getTopEncabezados() async {
    
    // Trayendo información de news api
    final url = '$_urlNews/top-headlines?apiKey=$_apiKey&country=mx';

    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    this.encabezados.addAll( newsResponse.articles );

    notifyListeners();

  }

}