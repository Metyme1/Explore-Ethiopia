// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// import '../model/data_model.dart';
//
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class DataServices {
//   Future<List<Map<String, dynamic>>> getInfo() async {
//     final response = await http.get(Uri.parse('https://ethiotravelapp.000webhostapp.com/place/index.php'));
//
//     if (response.statusCode == 200) {
//       final decodedJson = jsonDecode(response.body);
//       final List<dynamic> dataList = decodedJson['data'];
//       final List<Map<String, dynamic>> data = dataList
//           .map((dynamic item) => Map<String, dynamic>.from(item))
//           .toList();
//
//       return data;
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }



// class DataServices{
//
// Future<List<Map<String, dynamic>>> getinfo() async {
//     final response = await http.get(Uri.parse('https://ethiotravelapp.000webhostapp.com/place/index.php'));
//
//     if (response.statusCode == 200) {
//       final decodedJson = jsonDecode(response.body);
//       print('decodedJson: $decodedJson');
//
//       final List<dynamic> dataList = decodedJson['data'];
//       print('dataList: $dataList');
//
//       final List<Map<String, dynamic>> dataM = dataList
//           .map((dynamic item) => Map<String, dynamic>.from(item))
//           .toList();
//       return dataM;
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }
// Future<List<Map<String, dynamic>>> _fetchData() async {
//     final response = await http.get(Uri.parse('https://ethiotravelapp.000webhostapp.com/place/index.php'));
//
//     if (response.statusCode == 200) {
//       final decodedJson = jsonDecode(response.body);
//       print('decodedJson: $decodedJson');
//
//       final List<dynamic> dataList = decodedJson['data'];
//       print('dataList: $dataList');
//
//       final List<Map<String, dynamic>> data = dataList
//           .map((dynamic item) => Map<String, dynamic>.from(item))
//           .toList();
//       return data;
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }