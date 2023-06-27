import 'package:ethiopia/pages/explore.dart';
import 'package:ethiopia/pages/map.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'my_page.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>Scaffold(
    body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.connectionState== ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(snapshot.hasData){
            return MyPage();
          }
          else if(snapshot.hasError){
            return Center(child: Text('something went wrong!'),);
          }
          else{
            return MapSample();
          }


        }
    ),
  );

}