

import 'package:flutter/material.dart';
import 'package:news_app/src/models/categoria_model.dart';

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

        final nombreCategoria = categorias[index].name;

      return Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            _CategoriaBoton(categorias[index]),
            SizedBox( height: 5 ),
            Text( '${ nombreCategoria[0].toUpperCase() }${ nombreCategoria.substring(1) }' )
          ],
        ),
      );
     },
    );
  }
}

class _CategoriaBoton extends StatelessWidget {
  
  final Categoria categoria;
  

  const _CategoriaBoton(this.categoria);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('${ categoria.name }');
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric( horizontal: 10 ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          categoria.icon,
          color: Colors.black54,
        )
      ),
    );
  }
}