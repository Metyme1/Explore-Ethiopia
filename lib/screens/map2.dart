import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  final String ID;
  MapPage({required this.ID});
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // Set your Google Maps API key here
  final String apiKey = 'AIzaSyDOmT3IuWcOq87wl4fUXlMDotiiJE2gzYw';

  // Create a GoogleMapController object
  late GoogleMapController mapController;

  // Create a LatLng object to hold the current location
  LatLng _center = LatLng(9.1450, 40.4897);

  // Create a function to fetch the latitude and longitude from the database
  Future<void> _fetchLocationFromDatabase(String ID) async {
    // Construct the URL for the query based on the ID parameter
    final url = 'https://ethiotravelapp.000webhostapp.com/place/index.php?id=$ID';

    try {
      // Make a request to your database and receive the data as a JSON object
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Extract the latitude and longitude as doubles
        final latitude = data['LATITUDE'].toDouble();
        final longitude = data['LONGITUDE'].toDouble();

        // Update the _center variable with the new latitude and longitude
        setState(() {
          _center = LatLng(latitude, longitude);
        });

        // Animate the camera to the new location
        mapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
            target: _center,
            zoom: 15.0,
          ),
        ));
      } else {
        // handle error
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // handle error
      print('Error: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.teal,
        title: Text('Map'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GoogleMap(
        // Set the initial camera position to the current location
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 15.0,
        ),
        // Pass the Google Maps API key to the map
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        // Add a marker at the current location
        markers: {
          Marker(
            markerId: MarkerId('current_location'),
            position: _center,
            infoWindow: InfoWindow(
              title: 'Current Location',
            ),
          ),
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Fetch the latitude and longitude of the 12th place in the database
          _fetchLocationFromDatabase(12.toString());
        },
        child: Icon(Icons.location_searching,),
      ),
    );
  }
}