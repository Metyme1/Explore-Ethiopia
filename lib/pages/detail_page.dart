import 'package:ethiopia/pages/signup_login.dart';
import 'package:ethiopia/widget/app_large_text.dart';
import 'package:ethiopia/widget/app_text.dart';
import 'package:ethiopia/widget/appbutton.dart';
import 'package:ethiopia/widget/explore_button.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars=3;
  int selectedIndex=-1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 20,
                top:50,
                child: Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.menu),
                color:Colors.white)
              ],
            )),
            Positioned(
              left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/welcome-2.jpg"),
                      fit:BoxFit.cover
                    ),

                  ),
                )
            ),
            Positioned(
              top:280,
                child: Container(
                  padding: const EdgeInsets.only(left:20,right:20,top:30),
                  width: MediaQuery.of(context).size.width,
                  height: 500,

                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),

                      )
                    ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(text: "Gonder", color:Colors.black54),
                          AppLargeText(text: "\$ 250", color:Colors.lightGreen),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on,color: Colors.lightGreen,),
                          AppText(text: "Gonder, Ethiopia", color:Colors.lightGreen),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                     Row(
                       children: [
                         Wrap(
                             children: List.generate(5, (index) {
                               return Icon(Icons.star,color: index<gottenStars?Colors.yellow:Colors.black12);

                             })
                         ),
                         SizedBox(
                           width: 10,
                         ),
                         AppText(text: "(4.0)",color: Colors.black12,)
                       ],
                     ),
                      SizedBox(
                        height: 25,
                      ),
                      AppLargeText(text: "People", color: Colors.black.withOpacity(0.8),size:20),
                  SizedBox(
                    height: 5,
                  ),
                     AppText(text: "Number of people"),
                      SizedBox(
                        height: 20,
                      ),
                      Wrap(
                        children: List.generate(5, (index){
                          return InkWell(
                            onTap:(){
                              setState(() {
                                selectedIndex=index;
                              });
                          },
                            child: Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: AppButtons(
                                size: 50,
                                color:selectedIndex==index?Colors.white:Colors.black,
                                backgroundColor:selectedIndex==index?Colors.black: Colors.lightGreen,
                                borderColor:selectedIndex==index?Colors.black:  Colors.lightGreen,
                                text:(index+1).toString()
                              ),
                            ),
                          );
                        }
                      )
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      AppLargeText(text: "Decription", color: Colors.black),
                      SizedBox(
                        height: 10,
                      ),
                      AppText(text: "this is the most incribble place  i have ever seen in  this is the most incribble place  i have ever seen in myglife"),

                    ],
                  ),
                  ),

            ),
            Positioned(
              bottom: 0,
              left:130,
              right:30,
              child: Row(
              children: [
              ElevatedButton(
              style: ElevatedButton.styleFrom(
              primary:Colors.lightGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {

              },
              child: Text('Book your trip now'),
            ),
              ],

              )

        )

          ],
            ),
      ),
    );
  }
}
