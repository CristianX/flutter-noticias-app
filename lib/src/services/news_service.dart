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
  String _categoriaSeleccionada = 'business';

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

  // Manejando en cache toda la información descargada de categorias
  Map<String, List<Article>> articulosCategoria = {};

  NewsService() {

    this.getTopEncabezados();

    categorias.forEach((item) {

      // Inicializando el listado en el objeto articulosCategoria
      this.articulosCategoria[item.name] = new List();
    });

  }

  // Getters y setters
  get categoriaSelecciona => this._categoriaSeleccionada;
  set categoriaSelecciona ( String valor ) {
    this._categoriaSeleccionada = valor;

    this.getArticulosPorCategoria( valor );

    notifyListeners();
  }

  // Para mostrar los artículos de la categoria seleccionada
  List<Article> get getArticulosCategoriaSeleccionada => this.articulosCategoria[ this.categoriaSelecciona ];

  getTopEncabezados() async {
    
    // Trayendo información de news api
    final url = '$_urlNews/top-headlines?apiKey=$_apiKey&country=mx';

    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    this.encabezados.addAll( newsResponse.articles );

    notifyListeners();

  }

  getArticulosPorCategoria( String categoria ) async {

    // Si ya esta cargando no se regresa nada más cache
    if( this.articulosCategoria[categoria].length > 0 ) {
      return this.articulosCategoria[categoria];
    }

    // Trayendo información de news api
    final url = '$_urlNews/top-headlines?apiKey=$_apiKey&country=mx&category=$categoria';

    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    this.articulosCategoria[categoria].addAll( newsResponse.articles );

    notifyListeners();

  }

}