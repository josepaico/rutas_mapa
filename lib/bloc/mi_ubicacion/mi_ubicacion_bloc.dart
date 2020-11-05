import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart' as Geolocato;
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:meta/meta.dart';

part 'mi_ubicacion_event.dart';
part 'mi_ubicacion_state.dart';

class MiUbicacionBloc extends Bloc<MiUbicacionEvent, MiUbicacionState> {
  MiUbicacionBloc() : super(MiUbicacionState());

  //final _geolocator = new Geolocator(); version antes del 6
  StreamSubscription<Geolocato.Position> _positionSubscription;

  void iniciarSeguimiento(){

    /*final geoLocatorOptions = Geolocato.LocationOptions(
      accuracy: Geolocato.LocationAccuracy.high,
      distanceFilter: 10
    );*/
    
    _positionSubscription = Geolocato.Geolocator.getPositionStream(
      desiredAccuracy: Geolocato.LocationAccuracy.high, //que tan precisa es
      distanceFilter: 10 //cada de 10 metros emite la ubi
    ).listen(( Geolocato.Position position) {
      final nuevaUbicacion = new LatLng(position.latitude, position.longitude);
      add( OnUbicacionCambio(nuevaUbicacion));

    });
    
  }

  void cancelarSequimiento(){
    _positionSubscription.cancel();
  }

  @override
  Stream<MiUbicacionState> mapEventToState(MiUbicacionEvent event,) async* {
    if( event is OnUbicacionCambio ){
      
      yield state.copyWith(
        existeUbicacion: true,
        ubicacion: event.ubicacion
      );
    }
  }
}
