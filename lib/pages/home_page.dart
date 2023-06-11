import 'package:ethiopia/pages/main_page.dart';
import 'package:ethiopia/widget/app_large_text.dart';
import 'package:ethiopia/widget/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/app_cubit.dart';
import '../cubit/app_cubit_state.dart';
import '../widget/bottomNavigationBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
 var images ={
     "gallery.jpeg":"Gallery",
     "event.jpg":"event",
     "cloths.jpg":"cloth",
 };
  @override
  Widget build(BuildContext context) {
    TabController _tabController =TabController(length: 4, vsync: this);
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
        body: BlocBuilder<AppCubits, CubitStates>(
          builder: (context, state){
            if(state is LoadedState){
              var info =state.places;
              return SingleChildScrollView(
                  child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          padding: const EdgeInsets.only(top:70,left:20),

                          child: Row(
                            children: [
                              Icon(Icons.arrow_back , size: 40, color:Colors.brown),
                              Expanded (child: Container()),
                              Container(
                                width:50,
                                height:50,
                                margin: const EdgeInsets.only(right:20),

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:Colors.grey.withOpacity(0.5)


                                ),

                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left:20),
                          child: AppLargeText(text: "Discover",color: Colors.black54),
                        ),

                        // Container(
                        //   padding: EdgeInsets.all(16.0),
                        //   child: TextField(
                        //
                        //     style: TextStyle(
                        //       fontSize: 18.0,
                        //       color: Colors.grey[800],
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //     decoration: InputDecoration(
                        //       hintText: 'Search',
                        //       hintStyle: TextStyle(
                        //         fontSize: 18.0,
                        //         color: Colors.grey[400],
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //       prefixIcon: Icon(
                        //         Icons.search,
                        //         color: Colors.grey[400],
                        //       ),
                        //       filled: true,
                        //       fillColor: Colors.grey[200],
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(30.0),
                        //         borderSide: BorderSide.none,
                        //       ),
                        //       contentPadding: EdgeInsets.symmetric(
                        //         vertical: 16.0,
                        //         horizontal: 24.0,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 30,),

                        // tabbar
                        Container(
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: TabBar(
                              labelPadding: const EdgeInsets.only(left: 20 , right:20),
                              controller: _tabController,
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.grey,
                              isScrollable: true,
                              // indicatorSize:TabBarIndicatorSize.label,
                              // indicator: CircleTabIndicator(color: Colors.purple,radius: 4),

                              tabs: [
                                Tab(text:"Historical places"),
                                Tab(text:"Scenic Views"),
                                Tab(text:"Bussiness Directories"),
                                Tab(text:"Religious areas"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left:20),
                          height: 200,
                          width: double.maxFinite,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              ListView.builder(

                                scrollDirection: Axis.horizontal,
                                itemCount:info.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: (){
                                      BlocProvider.of<AppCubits>(context).detailPage(info[index]);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 15,top: 10),
                                      width:200,
                                      height:500,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.white,
                                          image:DecorationImage(
                                            image:NetworkImage(""+info[index].img),
                                            fit:BoxFit.cover,
                                          )
                                      ),
                                    ),
                                  );
                                },

                              ),
                              Text("bye"),
                              Text("there"),
                              Text("hello")
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          // margin: const EdgeInsets.only(left: 20,right: 20),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                AppLargeText(text: "Explore More", size: 22,color: Colors.black),

                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                            height: 120,
                            width: double.maxFinite ,
                            margin: const EdgeInsets.only(left:20),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder:(_,index){

                                  return Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(right: 50),
                                          width:80,
                                          height:80,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.white,
                                              image:DecorationImage(
                                                image:AssetImage(
                                                    "images/"+images.keys.elementAt(index)

                                                ),
                                                fit:BoxFit.cover,

                                              )
                                          ),
                                        ),
                                        SizedBox(
                                          height:10 ,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: .0),
                                          child: Container(

                                            child: AppText(text:images.values.elementAt(index
                                            ),
                                              color: Colors.black,

                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }
                            )
                        ),

                      ]

                  )
              );
            }
            else{
              return Container();
            }

          }
        )
    );

  }
}
