import 'dart:async';
import 'dart:core';
import 'package:ethiopia/cubit/app_cubit.dart';
import 'package:ethiopia/pages/map2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ethiopia/pages/currency.dart';
import 'package:ethiopia/pages/gallery2.dart';
import 'package:ethiopia/pages/my_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../cubit/app_cubit_state.dart';
import '../widget/app_large_text.dart';
import 'detail_page.dart';
import 'map.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const LatLng _kLalibelaLatLng = LatLng(12.0307, 39.0446); // Coordinates for Lalibela, Ethiopia

  static const CameraPosition _kLalibelaPosition = CameraPosition(
    bearing: 0,
    target: _kLalibelaLatLng,
    tilt: 0,
    zoom: 18,
  );


  final user=FirebaseAuth.instance.currentUser!;
  late TabController _tabController;
  bool _isBookmarked = false;

  final List<String> images = [
    "images/categories/Hist&cal/lalibela.jpg",
    "images/categories/Hist&cal/fassil.jpg",
    "images/categories/Hist&cal/sof-omar.jpg",
    "images/categories/religious/al-negash.jpg",
    "images/categories/landscapes/danakil-2.jpg",
    "images/categories/urban and rural/kuriftu.jpg",

  ];
  final List<String> his = [
    "images/categories/Hist&cal/Harar-Jugol.jpg",
    "images/categories/Hist&cal/fassil.jpg",
    "images/categories/Hist&cal/sof-omar.jpg",
    "images/categories/Hist&cal/lalibela.jpg",
    "images/categories/landscapes/danakil-2.jpg",
    "images/categories/Hist&cal/axum-2.jpg"


  ];
  final List<String> Rel =[
    "images/categories/religious/Holy Trinity Cathedr.jpg",
    "images/categories/religious/negash.jpg",
    "images/categories/religious/anwar.jpeg",
    "images/categories/Hist&cal/debre-danos.jpg",
  ];
  final List<String> land =[
    "images/categories/landscapes/danakil-2.jpg",
    "images/categories/landscapes/blue.webp",
    "images/categories/landscapes/tana.jpeg",
    "images/categories/landscapes/dashen.jpg",
    "images/categories/landscapes/Tullu_Dimtu.jpg",
  ];
  final List<String> Resorts =[
    "images/categories/urban and rural/sheraton.jpg",
    "images/categories/urban and rural/kuriftu.jpg",
    "images/categories/urban and rural/emerald resort arbaminch.jpeg",
    "images/categories/urban and rural/lisak.jpg",


  ];
  final List<String> rural =[
    "images/categories/urban and rural/gurage.jpeg",
    "images/categories/urban and rural/gamo.jpg",

  ];




  final List<String> names = [
    "Lalibela",
    "Gonder",
    "sof-omar",
    "al Negash",
    "Danakil",
    "Kuriftu",
  ];
  final List<String> locations= [
    " North Wollo",
    " Amhara",
    "East of Ginnir",
    "Tigray Region ",
    "Afar Region",
    "Deberzyit",
  ];
  final List<String> map=[


  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  void _toggleBookmark() {
    setState(() {
      _isBookmarked = !_isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(

            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Container(
                    padding: const EdgeInsets.only(top: 70, left: 10),
                    child: Row(
                      children: [
                        Builder(
                          builder: (context) => IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                          ),
                        ),
                        Expanded(child: Container()),
                        Text("Hello, "+user.displayName!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),),
                        Container(
                          width: 50,
                          height: 50,
                          margin: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.5),
                            image: DecorationImage(
                              image: NetworkImage(
                                user.photoURL!,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: AppLargeText(text: "Discover", color: Colors.black54),
                  ),
                  SizedBox(height: 30),
                  // tabbar
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        labelPadding: const EdgeInsets.only(left: 20, right: 20,),
                        controller: _tabController,
                        labelColor: Colors.teal,
                        unselectedLabelColor: Colors.grey,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: CircleTabIndicator(color: Colors.teal, radius: 5),
                        tabs: [
                          Tab(text: "Historical and cultural places"),
                          Tab(text: "Religious"),
                          Tab(text: "landscapes"),
                          Tab(text: "Hotel and resorts"),
                          // Tab(text: "rural"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 250,
                    width: double.maxFinite,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: his.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DetailPage(
                                    image: his[index],

                                  ),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 15, top: 10),
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),

                                  color: Colors.white,
                                  image: DecorationImage(

                                    image: AssetImage(his[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),

                              ),
                            );
                          },
                        ),
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Rel.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DetailPage(
                                    image: Rel[index],

                                  ),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 15, top: 10),
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(

                                    image: AssetImage(Rel[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),

                              ),
                            );
                          },
                        ),
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: land.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DetailPage(
                                    image: land[index],

                                  ),),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 15, top: 10),
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(

                                    image: AssetImage(land[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),

                              ),
                            );
                          },
                        ),
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Resorts.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DetailPage(
                                    image: Resorts[index],

                                  ),),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 15, top: 10),
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(

                                    image: AssetImage(Resorts[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),

                              ),
                            );
                          },
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 30),



                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: AppLargeText(text: "Popular sites", size: 22, color: Colors.teal),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.7,
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DetailPage(
                                image: his[index],

                              ),),
                            ); // navigate to
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage(images[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                AppText(
                                  text: names[index],
                                  color: Colors.black87,
                                  size: 18,
                                  weight: FontWeight.bold,
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        // Icon(
                                        //   Icons.location_on,
                                        //   color: Colors.grey,
                                        // ),
                                        SizedBox(width: 5),
                                        Center(
                                          child: AppText(
                                            text:locations[index],
                                            color: Colors.grey,
                                            size: 16,
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ]

            ),


      ),



        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: 305,// Set the height to your desired value
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.teal,
                  ),

                  child: Text(""),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Gallery()),
                  );
                },
              ),

              // SizedBox(
              //   height: 20,
              // ),
              // ListTile(
              //   leading: Icon(Icons.gps_fixed),
              //   title: Text('Map'),
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       // MaterialPageRoute(builder: (context) => MapPage(ID: id,)),
              //     );
              //   },
              // ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Icon(Icons.miscellaneous_services_rounded),
                title: Text('Setting'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyPage()),
                  );
                },
              )
            ],
          ),
        ),

  );

  }
}

class AppText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;

  AppText({
    required this.text,
    this.color = Colors.black,
    this.size = 16,
    this.weight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({required this.color , required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
// TODO: implement createBoxPainter
    return _CirclePainter(color:color, radius:radius);
  }
}

class _CirclePainter extends BoxPainter {
  @override
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset CircleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius / 2);
    canvas.drawCircle(offset + CircleOffset, radius, _paint);
  }
}