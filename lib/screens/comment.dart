// import 'dart:convert';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// class CommentPage extends StatefulWidget {
//
//   final int id;// place is ;
//
//   CommentPage({required this.id});
//
//   @override
//   _CommentPageState createState() => _CommentPageState();
// }
//
// class _CommentPageState extends State<CommentPage> {
//   late Future<List<Map<String, dynamic>>> _commentsFuture;
//   String? _userId;
//   @override
//   void initState() {
//     super.initState();
//     _commentsFuture = _fetchComments(widget.id);
//     _getUserInfo();
//   }
//  // this is user informetion
//   final userinfo=FirebaseAuth.instance.currentUser!;
//   Future<String> _getUserInfo() async {
//     final user=FirebaseAuth.instance.currentUser!;
//     // TODO: Replace with your logic to get the user ID
//       //_userId = user.email;
//       return user.email.toString();
//   }
//
//   Future<void> _addComment(String placeId, String comment) async {
//     // TODO: Replace with your logic to add the comment to the database
//     Map<String, dynamic> data = {
//       'userId': _userId,
//       'placeId': placeId,
//       'comment': comment,
//     };
//   //  await FirebaseFirestore.instance.collection('comments').add(data);
//   }
//
//
//   // this method for create new comment s
//   final url = 'https://ethiotravelapp.000webhostapp.com/comment/index.php';
//
//   Future<void> postComment(int placeId, String userId, String comment) async {
//     final body = {
//       'PLACE_ID': placeId,
//       'user_id': userId,
//       'comment': comment,
//     };
//     final headers = {
//       'Content-Type': 'application/json',
//       'Content-Length': utf8.encode(json.encode(body)).length.toString(),
//       'Host': Uri.parse(url).host,
//     };
//     try {
//       final response = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(body));
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         print(data);
//         // Handle successful response
//       } else {
//         // Handle non-200 response
//         print("not postijldjhfkj");
//       }
//     } catch (e) {
//       print(e);
//       // Handle connection error
//     }
//   }
//
//
//
//
//
//
//
//   TextEditingController _commentControler=TextEditingController();
//
//
//   Future<List<Map<String, dynamic>>> _fetchComments(int id) async {
//     try {
//       var response = await http.get(Uri.parse('https://ethiotravelapp.000webhostapp.com/comment/index.php?PLACE_ID=$id'));
//       if (response.statusCode == 200) {
//         List<dynamic> data = jsonDecode(response.body);
//         List<Map<String, dynamic>> comments = data.map((c) => {
//           'comment': c['COMMENT'],
//           'userId': c['USER_ID']
//         }).toList();
//         print(comments);
//         return comments;
//       } else {
//         throw Exception('Failed to fetch comments: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching comments: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
//               child: Text(
//                 'Reviews',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           FutureBuilder<List<Map<String, dynamic>>>(
//             future: _commentsFuture,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 List<Map<String, dynamic>>? comments = snapshot.data;
//                 return SliverList(
//                   delegate: SliverChildBuilderDelegate(
//                         (BuildContext context, int index) {
//                       String userId = comments![index]['userId'].toString();
//                       String comment = comments[index]['comment'];
//                       return InkWell(
//                         onTap: () {
//                           // TODO: Handle comment selection
//                         },
//                         child: Card(
//                           elevation: 4,
//                           margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                           child: Padding(
//                             padding: const EdgeInsets.all(16),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'User $userId',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 SizedBox(height: 5),
//                                 Text(comment),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                     childCount: comments?.length ?? 0,
//                   ),
//                 );
//               } else if (snapshot.hasError) {
//                 return SliverToBoxAdapter(
//                   child: Center(
//                     child: Text('Failed to fetch comments: ${snapshot.error}'),
//                   ),
//                 );
//               } else {
//                 return SliverToBoxAdapter(
//                   child: Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                 );
//               }
//             },
//           ),
//           SliverFillRemaining(
//             hasScrollBody: false,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextField(
//                     controller: _commentControler,
//                     decoration: InputDecoration(
//                       hintText: 'Add your comment',
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.grey, // Change this to the desired color
//                         ),
//                       ),
//                     ),
//                  // onChanged: (value) {
//                      // _commentText = value; // Update the comment text
//                     //      },
//                   ),
//                   SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () async {
//
//                 String _placeId=widget.id.toString();
//                 String userEmail=userinfo.email.toString();
//
//                 print(_commentControler.text.toString());
//                 if(_placeId!=null && userEmail!=null) {
//                   await postComment(int.parse(_placeId), userinfo.uid, _commentControler.text.toString()).then((value) => print("succesfully commented"));
//                   _commentControler.text="";
//                   _fetchComments(widget.id);
//                 }
//
//               },
//               child: Text('Submit'),
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
//               ),
//     )
//         ],
//       ),
//     )
//     )
//     ]
//     )
//     );
//   }
// }

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CommentPage extends StatefulWidget {
  final int id; // place is ;

  CommentPage({required this.id});

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  String? _userId;
  final userinfo = FirebaseAuth.instance.currentUser!;
  final url = 'https://ethiotravelapp.000webhostapp.com/comment/index.php';
  final _commentControler = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _getUserInfo();
    _userID=_getUserInfo();
  }

  Future<String> _getUserInfo() async {
    final user = FirebaseAuth.instance.currentUser!;
    // TODO: Replace with your logic to get the user ID
    //_userId = user.email;
    return user.email.toString();
  }

  // Future<void> _addComment(String placeId, String comment) async {
  //   // TODO: Replace with your logic to add the comment to the database
  //   Map<String, dynamic> data = {
  //     'userId': _userId,
  //     'placeId': placeId,
  //     'comment': comment,
  //   };
  //   //  await FirebaseFirestore.instance.collection('comments').add(data);
  // }

  Future<void> _postComment(int placeId, String userId, String comment) async {
    final body = {
      'PLACE_ID': placeId,
      'user_id': userId,
      'comment': comment,
    };
    final headers = {
      'Content-Type': 'application/json',
      'Content-Length': utf8.encode(json.encode(body)).length.toString(),
      'Host': Uri.parse(url).host,
    };
    try {
      final response = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        // Handle successful response
      } else {
        // Handle non-200 response

      }
    } catch (e) {
      print(e);
      // Handle connection error
    }
  }

  Future<List<Map<String, dynamic>>> _fetchComments(int id) async {
    try {
      var response = await http.get(Uri.parse('https://ethiotravelapp.000webhostapp.com/comment/index.php?PLACE_ID=$id'));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Map<String, dynamic>> comments = data.map((c) => {'comment': c['COMMENT'], 'userId': c['USER_ID']}).toList();

        return comments;
      } else {
        throw Exception('Failed to fetch comments: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching comments: $e');
    }
  }

  Future<void> _refreshComments() async {
    setState(() {
      _commentsFuture = _fetchComments(widget.id);
    });
  }

  Future<void> _submitComment() async {
    setState(() {
      isclickedFloat=true;
    });
    if (_key.currentState!.validate()) {
      String _placeId = widget.id.toString();
      String userEmail = userinfo.email.toString();
      if (_placeId != null && userEmail != null) {
        await _postComment(int.parse(_placeId), userinfo.uid, _commentControler.text.toString()).then((value) => print("successfully commented"));
        _commentControler.text = "";
        setState(() {
          isclickedFloat=false;
        });
        _refreshComments();
      }
    }
  }

  late Future<List<Map<String, dynamic>>> _commentsFuture = _fetchComments(widget.id);
  bool isclickedFloat=false;
  var _userID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Reviews'),
      // ),
    
        body: Container(
          color: Colors.brown,
          child: Center(
            child: Container(
              height: 600,
              width: double.infinity,
              margin: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      child: Center(
                        child: Text(
                          'Reviews',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
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
                              String name = comments[index]['name'] ?? 'Mety Million';


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
                                        if(userId == userinfo.uid.toString())
                                          Text(
                                            'Your comment',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.brown,
                                            ),
                                          ),
                                        Text(
                                          'User: $name',
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
                ],
              ),
            ),
          ),
        ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        onPressed :  _submitComment,
        child: isclickedFloat!=true? Icon(Icons.send):CircularProgressIndicator( color: Colors.brown,),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
        child: Form(
          key: _key,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _commentControler,
                  decoration: InputDecoration(
                    hintText: 'Add your comment',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey, // Change this to the desired color
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a comment';
                    }
                    return null;
                  },
                  key: Key('comment_field'),
                ),
              ),
              SizedBox(width: 16),
              // ElevatedButton(
              //   onPressed: _submitComment,
              //   child: Text('Submit'),
              //   style: ButtonStyle(
              //     backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}