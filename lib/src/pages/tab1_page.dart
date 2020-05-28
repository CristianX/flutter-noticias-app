import 'package:flutter/material.dart';

// Service
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/widgets/lista_noticias.dart';

// Dependencia paquete provider
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

// AutomaticKeepAliveClientMixin para mantener el estado del scroll del tab
class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    // newsService.encabezados;

    //  ListaNoticias( newsService.encabezados ),


    return Scaffold(

      // Operador ternario para el indicador de carga de noticias
      body: ( newsService.encabezados.length == 0 ) ? Center(
        child: CircularProgressIndicator(),
      ) : ListaNoticias( newsService.encabezados )
      
    );
  }

  @override
  // Tambieén se usa para destruirlo con algún tipo de condición
  bool get wantKeepAlive => true;
}