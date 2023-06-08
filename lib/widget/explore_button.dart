import 'package:ethiopia/pages/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExploreButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ExploreButton({Key? key, this.width, this.isResponsive=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
          width:width,
          height:60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            //color: Colors.purple
          ),
          child:Row(
            children: [

              // Image.asset("img/")
              ElevatedButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage(),)
                );
              },
                child: Text(">>>>"),


              )
            ],
          )
      ),
    );
  }
}