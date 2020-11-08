import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapa_app/bloc/busqueda/busqueda_bloc.dart';
import 'package:mapa_app/bloc/mapa/mapa_bloc.dart';
import 'package:mapa_app/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
import 'package:mapa_app/pages/acceso_gps_page.dart';
import 'package:mapa_app/pages/loading_page.dart';
import 'package:mapa_app/pages/mapa_page.dart';
import 'package:mapa_app/pages/test_marker_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  //AIzaSyB3bXFCfZ4jESyCP8CF-HRM8SPlQ4m4wm0
  //sah1: 9C:3E:75:D9:85:C7:80:F6:FD:5B:2C:65:B1:2B:BD:05:94:12:40:2B
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MiUbicacionBloc()),
        BlocProvider(create: (_) => MapaBloc()),
        BlocProvider(create: (_) => BusquedaBloc()),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: LoadingPage(),
        routes: {
          'mapa': (_) => MapaPage(),
          'loading' : (_) => LoadingPage(),
          'acceso_gps' : (_) => AccesoGpsPage()
        },
      ),
    );
  }
}