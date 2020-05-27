import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _Paginas(),
      bottomNavigationBar: _Navegacion(),
      
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // BottomNavigationBar necesita por lo menos 2 items para funcionar
    return BottomNavigationBar(
      // Item seleccionado por default
      currentIndex: 0,
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