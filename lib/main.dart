import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'src/locations.dart' as locations;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Completer<GoogleMapController> _controller = Completer();
  late LatLng currentLatLng = const LatLng(-7.687855, 112.719367);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Google Maps Flutter'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          initialCameraPosition: CameraPosition(
            target: currentLatLng,
            zoom: 15,
          ),
          markers: <Marker>{
            Marker(
                markerId: const MarkerId("1"),
                position: currentLatLng,
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: const InfoWindow(
                  title: 'Location',
                  snippet: 'Mojotengah, Sukorejo',
                ))
          },
        ),
      ),
    );
  }
}
