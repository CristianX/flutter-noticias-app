

import 'package:flutter/material.dart';

// Servicios
import 'package:news_app/src/services/news_service.dart';


// Package provider
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Column(
          children: <Widget>[

            // Expanded para que el widget se dibuje de acuerdo al contenido de este
            Expanded(child: _ListaCategorias()),

          ],
        ),

      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    
    final categorias = Provider.of<NewsService>(context).categorias;


    return ListView.builder(
      // Quitando indicación de final de scroll
      physics: BouncingScrollPhysics(),
      // Añadiendo scroll horizontal
      scrollDirection: Axis.horizontal,
      itemCount: categorias.length,
      itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Icon( categorias[index].icon ),
            SizedBox( height: 5 ),
            Text( categorias[index].name )
          ],
        ),
      );
     },
    );
  }
}