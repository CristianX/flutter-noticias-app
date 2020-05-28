

import 'package:flutter/material.dart';
import 'package:news_app/src/models/categoria_model.dart';

// Servicios
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/theme/tema.dart';

// Widgets
import 'package:news_app/src/widgets/lista_noticias.dart';


// Package provider
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(

        body: Column(
          children: <Widget>[

            // Expanded para que el widget se dibuje de acuerdo al contenido de este
            _ListaCategorias(),

            Expanded(
              child: ListaNoticias( newsService.getArticulosCategoriaSeleccionada ),
            )



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


    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
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
      ),
    );
  }
}

class _CategoriaBoton extends StatelessWidget {
  
  final Categoria categoria;
  

  const _CategoriaBoton(this.categoria);

  @override
  Widget build(BuildContext context) {

    // Para redibujar el color del boton seleccionado
    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: (){
        // print('${ categoria.name }');

        // Para no redibujar listen: false (Solo en eventos tap)
        final newsService = Provider.of<NewsService>(context, listen: false );
        newsService.categoriaSelecciona = categoria.name;

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
          color: ( newsService.categoriaSelecciona == this.categoria.name ) ? miTema.accentColor : Colors.black54,
        )
      ),
    );
  }
}