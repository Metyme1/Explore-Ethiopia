import 'package:ethiopia/widget/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButtons extends StatelessWidget {
 final Color color;
 final Color backgroundColor;
 double size;
 String? text;

 final Color borderColor;
 AppButtons({Key? key,
   this.text,
   required this.size,
   required this.color,
   required this.backgroundColor,
   required this.borderColor}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(

    width: size,
    height: size,
decoration: BoxDecoration(
  border: Border.all(
    color: borderColor,
    width: 1.0,
  ),
borderRadius: BorderRadius.circular(15),
color: Colors.lightGreen,
),
      child:Center(child: AppText(text:text!,color:color))
);
  }
}
