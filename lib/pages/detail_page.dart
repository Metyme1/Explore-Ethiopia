import 'dart:async';
import 'dart:convert';

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
  // List<String> _comments = [
  //   'Comment 1 text',
  //   'Comment 2 text',
  //   'Comment 3 text',
  //   'Comment 4 text',
  //   'Comment 5 text',
  //   'Comment 6 text',
  // ]; // Make sure to initialize your comments list
  //
  // int _selectedIndex = 0;
  // String _selectedCommentText = 'Comment 1 text';
  // bool _isBookmarked = false;

  final TextEditingController _commentController = TextEditingController();
  final String apiKey = 'AIzaSyDOmT3IuWcOq87wl4fUXlMDotiiJE2gzYw';

  late GoogleMapController mapController;

  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};

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
  List<String> _comments = [];
  int _selectedIndex = -1;
  String _selectedCommentText = '';
  Future<List<Map<String, dynamic>>>? _commentsFuture;

  @override
  void initState() {
    super.initState();
    _title = fetchItemTitle(widget.id);
    _imageUrl = fetchImageUrl(widget.id);
    _description=fetchItemDescription(widget.id);
    _commentsFuture = _fetchComments(widget.id);

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
              top: 280,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
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
                        height: 300,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.white.withOpacity(0.0),
                              Colors.transparent,
                            ],
                          ),
                        ),
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
                          'Description',
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
                                height: 400.0,
                                child: GoogleMap(
                                  onMapCreated: (GoogleMapController controller) {
                                    mapController = controller;
                                  },
                                  initialCameraPosition: CameraPosition(
                                    target: _center,
                                    zoom: 10.0,
                                  ),
                                  zoomControlsEnabled: true,  // Enable zoom controls
                                ),
                              ),
                              SizedBox(height: 10.0),
                              ElevatedButton(
                                onPressed: () {
                                  _fetchLocationFromDatabase(widget.id);
                                },
                                child: Text('Fetch Location'),
                              ),
                              SizedBox(height: 10.0),
                            ],
                          ),
                        ),

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