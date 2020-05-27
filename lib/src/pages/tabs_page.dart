import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView(
        // Eliminando indicación de que ya no hay más scroll
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            color: Colors.red
          ),

          Container(
            color: Colors.green,
          )

        ],
      )
      
    );
  }
}