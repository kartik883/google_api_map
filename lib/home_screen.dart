import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer()
  static final CameraPosition kgoogle = CameraPosition(
    target: LatLng(28.704060, 77.102493),
    //target: LatLng(37.42965233500664, -122.06737456962),
    zoom: 14.4746,
  );

  // to mark the location
  List<Marker> _marker =[];
  List<Marker> _list =[
    Marker(
        markerId: MarkerId('1'),
      position: LatLng(28.704060, 77.102493),
      infoWindow: InfoWindow(
        title: 'my current location'
      ),
    ),

    Marker(
      markerId: MarkerId('2'),
      position: LatLng(28.696369, 77.091537),
      infoWindow: InfoWindow(
          title: 'Mangolpuri',
      ),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    _marker.addAll(_list);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: kgoogle,
        markers: Set<Marker>.of(_marker),
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
      ),
    );
  }
}
