// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<Map<String, dynamic>>(
//             future: _fetchData(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Text('${snapshot.data}');
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               } else {
//                 return CircularProgressIndicator();
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<Map<String, dynamic>> _fetchData() async {
//     final response = await http.get(Uri.parse('https://example.com/api/data'));
//
//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }
//
// void main() {
//   runApp(MyApp());
// }