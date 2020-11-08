import 'package:flutter/material.dart';
import 'package:mapa_app/custom_markers/custom_markers.dart';

class TestMarkerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350,
          height: 150,
          color: Colors.red,
          child: CustomPaint(
            painter: MarkerInicioPainter( 35 )
            /*painter: MarkerDestinoPainter(
              'Mi casa es por algun lado esta aqui hola mundo',
               250000 ),*/
            
          ),
        ),
     ),
   );
  }
}