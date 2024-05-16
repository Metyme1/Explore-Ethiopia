import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'comment.dart';
import 'map2.dart';


class DetailPage extends StatefulWidget {
 final int id;
 const DetailPage({required this.id});


  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {


  final TextEditingController _commentController = TextEditingController();
  final String apiKey = 'AIzaSyDOmT3IuWcOq87wl4fUXlMDotiiJE2gzYw';

  late GoogleMapController mapController;

  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  // Increase the zoom level of the map
  void _zoomIn() {
    mapController.animateCamera(CameraUpdate.zoomIn());
  }

// Decrease the zoom level of the map
  void _zoomOut() {
    mapController.animateCamera(CameraUpdate.zoomOut());
  }
  MapType _mapType = MapType.normal;

// Toggle between normal and satellite map types
  void _onMapTypeButtonPressed() {
    setState(() {
      if (_mapType == MapType.normal) {
        _mapType = MapType.satellite;
      } else {
        _mapType = MapType.normal;
      }
    });
  }

  LatLng _center = LatLng(9.1450, 40.4897);
  Future<void> _fetchLocationFromDatabase(int ID) async {
    final url = 'https://ethiotravelapp.000webhostapp.com/place/index.php?id=$ID';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final latitude = data[0]['LATITUDE'].toDouble();
        final longitude = data[0]['LONGITUDE'].toDouble();

        final LatLng location = LatLng(latitude, longitude);

        setState(() {
          _center = location;

          final MarkerId markerId = MarkerId('myMarker');

          final Marker marker = Marker(
            markerId: markerId,
            position: location,
            infoWindow: InfoWindow(title: 'My Marker', snippet: 'Marker Details'),
          );

          _markers.clear();
          _markers.add(marker);
        });

        mapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
            target: _center,
            zoom: 15.0,
          ),
        ));
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }


  Future<String> fetchImageUrl(int id) async {
    final String serverUrl = 'https://ethiotravelapp.000webhostapp.com/place/index.php';
    final response = await http.get(Uri.parse('$serverUrl?id=$id'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      if (jsonData.isNotEmpty) {
        final dynamic picUrl = jsonData[0]['PIC_URL'];
        if (picUrl != null) {
          return picUrl.toString();
        }
      }
    }
    throw Exception('Failed to fetch image URL');
  }
  Future<String> fetchItemTitle(int id) async {
    final String serverUrl = 'https://ethiotravelapp.000webhostapp.com/place/index.php';
    final response = await http.get(Uri.parse('$serverUrl?id=$id'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      if (jsonData.isNotEmpty) {
        final dynamic picUrl = jsonData[0]['TITLE'];
        if (picUrl != null) {
          return picUrl.toString();
        }
      }
    }
    throw Exception('Failed to fetch image URL');
  }
  Future<String> fetchItemDescription(int id) async {
    final String serverUrl = 'https://ethiotravelapp.000webhostapp.com/place/index.php';
    final response = await http.get(Uri.parse('$serverUrl?id=$id'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      if (jsonData.isNotEmpty) {
        final dynamic description = jsonData[0]['DESCRIPTION'];
        if (description != null) {
          return description.toString();
        }
      }
    }
    throw Exception('Failed to fetch item description');
  }
  Future<List<Map<String, dynamic>>> _fetchComments(int id) async {
    try {
      var response = await http.get(Uri.parse('https://ethiotravelapp.000webhostapp.com/comment/index.php?PLACE_ID=$id'));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Map<String, dynamic>> comments = data.map((c) => {
          'comment': c['COMMENT'],
          'userId': c['USER_ID']
        }).toList();
        print(comments);
        return comments;
      } else {
        throw Exception('Failed to fetch comments: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching comments: $e');
    }
  }

  late Future<String> _title;
  late Future<String> _imageUrl;
  late Future<String> _description;


  @override
  void initState() {
    super.initState();
    _title = fetchItemTitle(widget.id);
    _imageUrl = fetchImageUrl(widget.id);
    _description=fetchItemDescription(widget.id);


  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(

          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 20,
                top: 50,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              FutureBuilder<String>(
                future: _imageUrl,
                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.hasData) {
                    final String imageUrl = snapshot.data!;
                    return Container(
                      width: double.maxFinite,
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),




                Positioned(
                  left: 10,
                  top: 20,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context); // Navigate back to the previous screen
                    },
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                ),



            Positioned(
              top: 290,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 350,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        // decoration: BoxDecoration(
                        //   gradient: LinearGradient(
                        //     begin: Alignment.bottomCenter,
                        //     end: Alignment.topCenter,
                        //     colors: [
                        //       Colors.teal.withOpacity(0.5),
                        //       Colors.transparent,
                        //     ],
                        //   ),
                        // ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    FutureBuilder<String>(
    future: _title,
    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
    if (snapshot.hasData) {
    final String title = snapshot.data!;
    return Text(
    title,
    style: TextStyle(
    color: Colors.black,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    ),
    );
    } else if (snapshot.hasError) {
    return Center(
    child: Text('Error: ${snapshot.error}'),
    );
    } else {
    return Center(
    child: CircularProgressIndicator(),
    );
    }
    },

    ),


                      SizedBox(height: 20,),
                        Text(
                          'Description'.tr(),
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
    Expanded(
    child: FutureBuilder<String>(
    future: _description,
    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
    if (snapshot.hasData) {
    final String description = snapshot.data!;
    return Text(
      description,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
    );
    } else if (snapshot.hasError) {
    return Center(
    child: Text('Error: ${snapshot.error}'),
    );
    } else {
    return Center(
    child: CircularProgressIndicator(),
    );
    }
    },
    ),
    ),

    ],

    ),
    ),
    ),




                   SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CommentPage(id: widget.id)),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.message, color: Colors.teal),
                          SizedBox(width: 5),
                          Text(
                            'Comments',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                    ),




                        SizedBox(height: 40,),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: 500.0,
                                child: GoogleMap(
                                  onMapCreated: (GoogleMapController controller) {
                                    mapController = controller;
                                  },
                                  initialCameraPosition: CameraPosition(
                                    target: _center,
                                    zoom: 10.0,
                                  ),
                                  zoomControlsEnabled: false,  // Disable default zoom controls
                                  markers: _markers.toSet(),  // Set the markers on the map
                                  mapType: _mapType,  // Set the map type based on the selected value
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _zoomIn();
                                    },
                                    icon: Icon(Icons.add),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _zoomOut();
                                    },
                                    icon: Icon(Icons.remove),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _fetchLocationFromDatabase(widget.id);
                                    },
                                    icon: Icon(Icons.location_on),
                                  ),
                                  SizedBox(width: 10.0),
                                  DropdownButton<MapType>(
                                    value: _mapType,
                                    items: [
                                      DropdownMenuItem<MapType>(
                                        value: MapType.normal,
                                        child: Text('Normal'),
                                      ),
                                      DropdownMenuItem<MapType>(
                                        value: MapType.satellite,
                                        child: Text('Satellite'),
                                      ),
                                      DropdownMenuItem<MapType>(
                                        value: MapType.hybrid,
                                        child: Text('Hybrid'),
                                      ),
                                      DropdownMenuItem<MapType>(
                                        value: MapType.terrain,
                                        child: Text('Terrain'),
                                      ),
                                    ],
                                    onChanged: (MapType? value) {
                                      setState(() {
                                        _mapType = value ?? MapType.normal;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                            ],
                          ),
                        )

    ]
                    )
    ),
    ),
    )
                )
              ]
            )
        )
              );






  }}

// Future<void> _fetchLocationFromDatabase(int id) async {
//   final url = 'https://ethiotravelapp.000webhostapp.com/place/index.php?id=$id';
//
//   try {
//     final response = await http.get(Uri.parse(url));
//
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//
//       final latitude = data[0]['LATITUDE'].toDouble();
//       final longitude = data[0]['LONGITUDE'].toDouble();
//
//       final location = LatLng(latitude, longitude);
//
//       setState(() async {
//         _center = location;
//
//         final MarkerId markerId = MarkerId('myMarker');
//
//         final Uint8List? markerIconBytes = await getBytesFromAsset('images/logo.jpg', 100);
//         final BitmapDescriptor markerIcon = BitmapDescriptor.fromBytes(markerIconBytes!);
//
//         final Marker marker = Marker(
//           markerId: markerId,
//           position: location,
//           icon: markerIcon,
//           infoWindow: InfoWindow(title: 'My Marker', snippet: 'Marker Details'),
//         );
//
//         _markers.clear();
//         _markers.add(marker);
//
//         // Set the map type to satellite
//         _mapType = MapType.satellite;
//       });
//
//       // Animate the camera to the new position and zoom level
//       mapController.animateCamera(CameraUpdate.newCameraPosition(
//         CameraPosition(
//           target: _center,
//           zoom: 15.0,
//         ),
//       ));
//     } else {
//       print('Error: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error: $e');
//   }
// }