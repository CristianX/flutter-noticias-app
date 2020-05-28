import 'package:flutter/material.dart';

// Modelos
import 'package:news_app/src/models/news_models.dart';

class ListaNoticias extends StatelessWidget {

  final List<Article> noticias;

  // Constructor
  ListaNoticias( this.noticias );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.noticias.length,
      itemBuilder: (BuildContext context, int index) {
      return Text( this.noticias[index].title);
     },
    );
  }
}