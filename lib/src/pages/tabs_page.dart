import 'package:flutter/material.dart';

// Paquete provider
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Instancia global
      create: (_) => new _NavegacionModel(),
      child: Scaffold(

        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
        
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Obteniendo instancia de clase como que fuera un Singleton
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    // BottomNavigationBar necesita por lo menos 2 items para funcionar
    return BottomNavigationBar(
      // Item seleccionado por default
      currentIndex: navegacionModel.paginaActual,
      // para delvolver el indice
      onTap: (i) => navegacionModel.paginaActual = i,
      items: [
        BottomNavigationBarItem( icon: Icon( Icons.person_outline ), title: Text( 'Para ti' ) ),
        BottomNavigationBarItem( icon: Icon( Icons.public ), title: Text( 'Encabezados' ) ),
        
      ]
    );
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      // Eliminando indicación de que ya no hay más scroll
      // physics: BouncingScrollPhysics(),
      // Evitando deslizamiento
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          color: Colors.red
        ),

        Container(
          color: Colors.green,
        )

      ],
    );
  }
}


class _NavegacionModel with ChangeNotifier{

  int _paginaActual = 0;

  // Getters
  int get paginaActual => this._paginaActual;

  // Setter
  set paginaActual( int valor ) {
    this._paginaActual = valor;

    // Para que todos los widgets esten pendientes de ese valor
    notifyListeners();
  }


}