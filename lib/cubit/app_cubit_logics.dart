import 'package:ethiopia/pages/explore.dart';
import 'package:ethiopia/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:ethiopia/cubit/app_cubit_state.dart";
import 'package:bloc/bloc.dart';


import '../pages/detail_page.dart';
import 'app_cubit.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state){
          if(state is WelcomeState){
            return Welcome();
          }
          if(state is LoadedState){
            return HomePage();
          } if(state is LoadedState) {
            return Center(child: CircularProgressIndicator(),);
          }
          if(state is DetailState) {
            return DetailPage();
          }else{
            return Container();
          }
        }

      )
    );
  }
}
