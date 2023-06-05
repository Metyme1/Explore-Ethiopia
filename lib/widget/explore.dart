import 'package:ethiopia/widget/app_large_text.dart';
import 'package:ethiopia/widget/app_text.dart';
import 'package:ethiopia/widget/explore_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class explore extends StatefulWidget {
  const explore({Key? key}) : super(key: key);

  @override
  State<explore> createState() => _exploreState();
}

class _exploreState extends State<explore> {
  List images =[
    "white.png",
    "white.png",
    "white.png",
  ];
  //List text =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_,index){
            return Container(
                width: double.maxFinite,
                height:double.maxFinite,
                decoration:BoxDecoration(
                    image:DecorationImage(
                        image:AssetImage(
                            "images/"+images[index]


                        ),
                        fit: BoxFit.cover
                    )
                ) ,
                child: Container(

                    margin: const EdgeInsets.only(top:150,left:20,right:20),
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                AppLargeText(text:"welcome"//text[index]
                                  ,color: Colors.white,),
                                AppText(text: "to ethiopia", size: 30,),
                                SizedBox(
                                    height:20
                                ),
                                Container(
                                    width:250,
                                    child:AppText(
                                      text:"The magic of Ethiopia challenges preconceptions and defies expectations, beckoning visitors to explore its mysteries and discover its secrets.",
                                      color:Colors.black,
                                      size: 14,


                                    )
                                ),
                                SizedBox(
                                    height:40
                                ),
                                ExploreButton()
                              ]
                          ),
                          Column(
                            children: List.generate(3, (indexSlider) {
                              return Container(
                                  margin: const EdgeInsets.only(bottom:2),
                                  width: 8,
                                  height:index==indexSlider?25:8,
                                  decoration:BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      // index==indexSlider?Colors.red:Colors.red.withOpacity(0.3),
                                      color:Colors.red
                                  )
                              );
                            }),
                          )
                        ]
                    )
                )
            );
          }),
    );
  }
}