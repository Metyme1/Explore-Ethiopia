
import 'package:ethiopia/pages/detail_page.dart';
import 'package:ethiopia/pages/explore.dart';

import 'package:ethiopia/pages/google_signin.dart';

import 'package:provider/src/change_notifier_provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';





Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GoogleSign(),
      child: MaterialApp(

          title: 'Ethiopia',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:Explore(),
        // supportedLocales: [
        //   Locale('en','UK'),
        //   Locale('fr','FR')
        // ],
        // localizationsDelegates: [
        //   AppLocalizations.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate
        //
        // ],
        //   localeResolutionCallback: (locale, supportedLocales) {
        //     for (var supportedLocale in supportedLocales) {
        //       if (supportedLocale.languageCode == locale?.languageCode &&
        //           supportedLocale.countryCode == (locale?.countryCode ?? '')) {
        //         return supportedLocale;
        //       }
        //     }
        //     return supportedLocales.first;
        //   }
          )
      );

  }
}
//
// class maya extends StatefulWidget {
//   const maya({Key? key}) : super(key: key);
//
//   @override
//   State<maya> createState() => _mayaState();
// }
//
// class _mayaState extends State<maya> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(
//           AppLocalizations.of(context)!.translate('explore')!,
//         style: TextStyle(fontSize: 25),),
//       ),
//     );
//   }
// }




















// }
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class MyApp extends StatelessWidget {
//   @override
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<List<Map<String, dynamic>>>(
//             future: _fetchData(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return ListView.builder(
//                   itemCount: snapshot.data?.length,
//                   itemBuilder: (context, index) {
//                     final item = snapshot.data?[index];
//                     return ListTile(
//                       leading: Text('${item?['ID']}'),
//                       title: Text('${item?['TITLE']}'),
//                       subtitle: Text('${item?['DESCRIPTION']}'),
//                     );
//                   },
//                 );
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
//   Future<List<Map<String, dynamic>>> _fetchData() async {
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
//   void main() {
//     runApp(MyApp());
//   }
