import 'dart:ui';


import 'package:flutter/material.dart';

import 'colors.dart';



class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(home:explore());

  }
}

class explore extends StatefulWidget {
  const explore({Key? key}) : super(key: key);

  @override
  State<explore> createState() => _exploreState();
}

class _exploreState extends State<explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Stack(
          children: [//Image.asset("",fit:BoxFit.cover,
            //   height:double.infinity,
            //   width:double.infinity,
            //
            // ),

            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,


                  children : [

                   const Text(
                      "Explore new destinations",
                      style:TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                   const SizedBox(
                      height: 30,
                    ),
                    Material(
                      borderRadius:BorderRadius.circular(100),
                      elevation:5,
                      child: Container(
                        decoration: BoxDecoration(
                            color:Colors.white,borderRadius:BorderRadius.circular(100)
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(

                            children: [

                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText:"search your destination",
                                      prefixIcon:Icon(Icons.search),
                                      enabledBorder:InputBorder.none,
                                      focusedBorder:InputBorder.none

                                  ),
                                ),

                              ),

                              CircleAvatar(
                                  backgroundColor: Colors.green,
                                  child:Icon(
                                    Icons.sort_by_alpha_sharp,
                                    color:KWhiteClr,

                                  )

                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ]
              ),
            )
          ],
        )
    );

  }
}

