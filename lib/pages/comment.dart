// import 'dart:convert';
// import 'dart:html';
//
// import 'package:flutter/material.dart';
//
// class CommentPage extends StatefulWidget {
//   final String placeId;
//
//   CommentPage({required Key key, required this.placeId}) : super(key: key);
//
//   @override
//   _CommentPageState createState() => _CommentPageState();
// }
//
// class _CommentPageState extends State<CommentPage> {
//   List<Comment> _comments = [];
//   late String _userId;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchComments(widget.placeId);
//     _fetchUserId(widget.placeId).then((userId) {
//       setState(() {
//         _userId = userId;
//       });
//     });
//   }
//
//   Future<void> _fetchComments(String placeId) async {
//     try {
//       var response = await http.get(Uri.parse('https://ethiotravelapp.000webhostapp.com/comment/index.php?place_id=$placeId'));
//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
//         List<Comment> comments = List<Comment>.from(data['comments'].map((c) => Comment.fromJson(c)));
//         setState(() {
//           _comments = comments;
//         });
//       } else {
//         print('Failed to fetch comments: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error fetching comments: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Comments'),
//       ),
//       body: Column(
//         children: <Widget>[
//           _userId != null ? Text('User ID: $_userId') : CircularProgressIndicator(),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _comments.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   title: Text(_comments[index].comment),
//                   subtitle: Text('User ID: ${_comments[index].userId}'),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }