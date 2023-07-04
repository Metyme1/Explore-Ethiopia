import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class CommentPage extends StatefulWidget {
  final int id;

  CommentPage({required this.id});

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  late Future<List<Map<String, dynamic>>> _commentsFuture;
  String? _userId;
  String? _placeId;
  String? _commentText;
  @override
  void initState() {
    super.initState();
    _commentsFuture = _fetchComments(widget.id);
    _getUserInfo();
  }

  Future<void> _getUserInfo() async {
    // TODO: Replace with your logic to get the user ID
      _userId = 'youruser';
  }

  Future<void> _addComment(String placeId, String comment) async {
    // TODO: Replace with your logic to add the comment to the database
    Map<String, dynamic> data = {
      'userId': _userId,
      'placeId': placeId,
      'comment': comment,
    };
  //  await FirebaseFirestore.instance.collection('comments').add(data);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
              child: Text(
                'Reviews',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          FutureBuilder<List<Map<String, dynamic>>>(
            future: _commentsFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Map<String, dynamic>>? comments = snapshot.data;
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      String userId = comments![index]['userId'].toString();
                      String comment = comments[index]['comment'];
                      return InkWell(
                        onTap: () {
                          // TODO: Handle comment selection
                        },
                        child: Card(
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
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
                        ),
                      );
                    },
                    childCount: comments?.length ?? 0,
                  ),
                );
              } else if (snapshot.hasError) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text('Failed to fetch comments: ${snapshot.error}'),
                  ),
                );
              } else {
                return SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Add your comment',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey, // Change this to the desired color
                        ),
                      ),
                    ),
                 // onChanged: (value) {
                     // _commentText = value; // Update the comment text
                    //      },
                  ),
                  SizedBox(height: 16),
    //         ElevatedButton(
    //           onPressed: () async {
    //             if (_userId != null && id != null && _commentText != null) {
    //               await _addComment(_placeId!, _commentText!); // Add the comment to the database
    //               setState(() {
    //                 _commentsFuture = _fetchComments(); // Refresh the comments list
    //               });
    //             }
    //           },
    //           child: Text('Submit'),
    //           style: ButtonStyle(
    //             backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
    //           ),
    // )


        ],
      ),
    )
    )
    ]
    )
    );
  }
}