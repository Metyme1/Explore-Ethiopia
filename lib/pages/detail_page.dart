import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  Future<String> _fetchLocationIdFromDatabase() async {
    // Construct the URL for the query
    final url = 'https://ethiotravelapp.000webhostapp.com/place/index.php';

    try {
      // Make a request to your database and receive the data as a JSON object
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Extract the ID of the selected location
        final id = data['id'].toString();

        return id;
      } else {
        // handle error
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // handle error
      print('Error: $e');
    }

    return '';
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
                        height: 400,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.teal.withOpacity(0.5),
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

                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 300,
                                      child: Center(
                                        child: Text('Map of the place',
                                        style: TextStyle(
                                       color:Colors.black,
                                        fontWeight: FontWeight.bold,
                                    ),

                                      ),
                                      )
                                    );
                                  },
                                );
                              },
                              child: IconButton(
                                onPressed: () {
                                  // Fetch the ID of the selected location from the database
                                  _fetchLocationIdFromDatabase().then((id) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MapPage(ID: id),
                                      ),
                                    );
                                  });
                                },
                                icon: Icon(Icons.location_on),
                              )
                            ),
                            SizedBox(width: 5),
                            // Text(
                            //   'title',
                            //   style: TextStyle(
                            //     color: Colors.grey,
                            //     fontSize: 16,
                            //   ),
                            // ),
                          ],
                        ),

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
                        Text(
                          'Add comment',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _commentController,
                          decoration: InputDecoration(
                            hintText: 'Enter your comment here',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.teal),
                          ),
                          onPressed: () {
                            setState(() {
                              _comments.add(_commentController.text);
                              _selectedIndex = _comments.length - 1;
                              _selectedCommentText = _comments[_selectedIndex];
                              _commentController.clear();
                            });
                          },
                          child: Text('Post comment'),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Comments',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                      FutureBuilder<List<Map<String, dynamic>>>(
                        future: _commentsFuture,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<Map<String, dynamic>>? comments = snapshot.data;
                            return Column(
                              children: <Widget>[
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: comments?.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      String userId = comments![index]['userId'].toString();
                                      String comment = comments[index]['comment'];
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            _selectedIndex = index;
                                            _selectedCommentText = comment;
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(vertical: 10),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'User $userId',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(comment),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return Center(child: Text('Failed to fetch comments: ${snapshot.error}'));
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },

                      )
          ]
              ),
            ),


    )
              )
            )
            ]
        )
    )

      );

  }}