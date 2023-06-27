import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const LatLng _kLalibelaLatLng = LatLng(12.0307, 39.0446); // Coordinates for Lalibela, Ethiopia

  static const CameraPosition _kLalibelaPosition = CameraPosition(
    bearing: 0,
    target: _kLalibelaLatLng,
    tilt: 0,
    zoom: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.terrain, // Change to terrain map type
        initialCameraPosition: _kLalibelaPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          Marker(
            markerId: MarkerId('lalibela'),
            position: _kLalibelaLatLng,
            infoWindow: InfoWindow(title: 'Lalibela', snippet: 'Ethiopia'),
          ),
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToLalibela,
        label: const Text('Take me to Lalibela'),
        icon: const Icon(Icons.pin_drop),
      ),
    );
  }

  Future<void> _goToLalibela() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLalibelaPosition));
  }
}