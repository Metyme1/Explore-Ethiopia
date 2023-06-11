import 'package:ethiopia/cubit/app_cubit.dart';
import 'package:ethiopia/cubit/app_cubit_logics.dart';
import 'package:ethiopia/pages/calender.dart';
import 'package:ethiopia/pages/cloths.dart';
import 'package:ethiopia/pages/detail_page.dart';
import 'package:ethiopia/pages/gallery.dart';
import 'package:ethiopia/pages/home_page.dart';
import 'package:ethiopia/pages/main_page.dart';
import 'package:ethiopia/pages/map.dart';
import 'package:ethiopia/pages/my_page.dart';
import 'package:ethiopia/pages/signup_login.dart';
import 'package:ethiopia/pages/trip_booking.dart';
import 'package:ethiopia/pages/explore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
//
// Future main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
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
        home:SignLogin()
        // BlocProvider<AppCubits>(
        //   create: (context)=>AppCubits(),
        //   child: AppCubitLogics(),
        // )
    );
  }
}

