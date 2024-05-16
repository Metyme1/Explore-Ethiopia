
import 'package:easy_localization/easy_localization.dart';
import 'package:ethiopia/screens/cur.dart';
import 'package:ethiopia/screens/explore.dart';
import 'package:ethiopia/screens/google_signin.dart';


import 'package:provider/src/change_notifier_provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';





Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('am', 'ET')],
      path: 'assets/translations',

      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GoogleSign(),
      child: MaterialApp(

          title: 'Ethiopia',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Coppins',
            primarySwatch: Colors.blue,
          ),
          home:Explore(),

          )
      );

  }
}


















