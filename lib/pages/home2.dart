import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class My extends StatefulWidget {
  const My({Key? key}) : super(key: key);

  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<My> {
  final String category = 'historical';
  late final String serverUrl = 'https://ethiotravelapp.000webhostapp.com/place/index.php';

  Future<List<String>> fetchImages(String categoryParam) async {
    final response = await http.get(Uri.parse('$serverUrl?category=$categoryParam'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> dataList = data['data'];
      final List<String> picUrls = dataList.map((item) => item['PIC_URL'].toString()).toList();
      return picUrls;
      print(picUrls);
    } else {
      throw Exception('Failed to fetch images');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Container(
        child: Center(
          child: Text('Hello, World!'),
        ),
      ),
    );
  }
}



//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('My Page')),
//       body: Center(
//         child: FutureBuilder<List<String>>(
//           future: fetchImages(category),
//           builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
//             if (snapshot.hasData) {
//               final List<String> picUrls = snapshot.data!;
//               return ListView.builder(
//                 itemCount: picUrls.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final String picUrl = picUrls[index];
//                   return Image.network(picUrl);
//                 },
//               );
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else {
//               return CircularProgressIndicator();
//             }
//           },
//         ),
//       ),
//     );
//   }
// }