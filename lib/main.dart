import 'package:ethiopia/pages/calender.dart';
import 'package:ethiopia/pages/currency.dart';

import 'package:ethiopia/pages/detail_page.dart';
import 'package:ethiopia/pages/explore.dart';
import 'package:ethiopia/pages/gallery.dart';
import 'package:ethiopia/pages/google_signin.dart';
import 'package:ethiopia/pages/home_page.dart';
import 'package:ethiopia/pages/main_page.dart';
import 'package:ethiopia/pages/map.dart';
import 'package:ethiopia/pages/my_page.dart';
import 'package:ethiopia/pages/recom.dart';
import 'package:ethiopia/pages/signup_login.dart';
import 'package:provider/src/change_notifier_provider.dart';
import 'package:ethiopia/pages/explore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key:key);

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
        home: Explore(),
      ),
    );
  }
}


