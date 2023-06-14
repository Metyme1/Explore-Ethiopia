import 'package:ethiopia/pages/calender.dart';
import 'package:ethiopia/pages/currency.dart';

import 'package:ethiopia/pages/detail_page.dart';
import 'package:ethiopia/pages/explore.dart';
import 'package:ethiopia/pages/gallery.dart';
import 'package:ethiopia/pages/home_page.dart';
import 'package:ethiopia/pages/main_page.dart';
import 'package:ethiopia/pages/map.dart';
import 'package:ethiopia/pages/signup_login.dart';

import 'package:ethiopia/pages/explore.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Ethiopia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:Explore(),
    );
  }
}
