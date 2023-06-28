import 'dart:async';
import 'dart:convert';
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
import 'package:http/http.dart' as http;
import '../cubit/app_cubit_state.dart';
import '../widget/app_large_text.dart';
import 'detail_page.dart';
import 'map.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {


  final user=FirebaseAuth.instance.currentUser!;
  late TabController _tabController;
  bool _isBookmarked = false;

  final String category = 'historical and cultural';

  Future<List<Map<String, dynamic>>> fetchImages(String categoryParam) async {
    final String serverUrl = 'https://ethiotravelapp.000webhostapp.com/place/index.php';
    final response = await http.get(Uri.parse('$serverUrl?category=$categoryParam'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      List<Map<String, dynamic>> images = [];
      for (final data in jsonData) {
        final dynamic picUrl = data['PIC_URL'];
        final dynamic id = int.parse(data['ID'].toString());
        if (picUrl != null) {
          images.add({
            'url': picUrl.toString(),
            'id': id,
          });
        }
      }
      return images;
    } else {
      throw Exception('Failed to fetch images');
    }



  }
  final String category2 = 'religious';

  Future<List<Map<String, dynamic>>> fetchImages2(String categoryParam) async {
    final String serverUrl = 'https://ethiotravelapp.000webhostapp.com/place/index.php';
    final response = await http.get(
        Uri.parse('$serverUrl?category=$categoryParam'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      List<Map<String, dynamic>> images = [];
      for (final data in jsonData) {
        final dynamic picUrl = data['PIC_URL'];
        final dynamic id = int.parse(data['ID'].toString());
        if (picUrl != null) {
          images.add({
            'url': picUrl.toString(),
            'id': id,
          });
        }
      }
      return images;
    } else {
      throw Exception('Failed to fetch images');
    }
  }
  final String category3 = 'landscapes';

  Future<List<Map<String, dynamic>>> fetchImages3(String categoryParam) async {
    final String serverUrl = 'https://ethiotravelapp.000webhostapp.com/place/index.php';
    final response = await http.get(Uri.parse('$serverUrl?category=$categoryParam'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      List<Map<String, dynamic>> images = [];
      for (final data in jsonData) {
        final dynamic picUrl = data['PIC_URL'];
        final dynamic id = int.parse(data['ID'].toString());
        if (picUrl != null) {
          images.add({
            'url': picUrl.toString(),
            'id': id,
          });
        }
      }
      return images;
    } else {
      throw Exception('Failed to fetch images');
    }

  }
  final String category4 = 'hotels';
  Future<List<Map<String, dynamic>>> fetchImages4(String categoryParam) async {
    final String serverUrl = 'https://ethiotravelapp.000webhostapp.com/place/index.php';
    final response = await http.get(Uri.parse('$serverUrl?category=$categoryParam'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      List<Map<String, dynamic>> images = [];
      for (final data in jsonData) {
        final dynamic picUrl = data['PIC_URL'];
        final dynamic id = int.parse(data['ID'].toString());
        if (picUrl != null) {
          images.add({
            'url': picUrl.toString(),
            'id': id,
          });
        }
      }
      return images;
    } else {
      throw Exception('Failed to fetch images');
    }

  }


  final List<String> images = [
    "images/categories/Hist&cal/lalibela.jpg",
    "images/categories/Hist&cal/fassil.jpg",
    "images/categories/Hist&cal/sof-omar.jpg",
    "images/categories/religious/al-negash.jpg",
    "images/categories/landscapes/danakil-2.jpg",
    "images/categories/urban and rural/kuriftu.jpg",

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
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: FutureBuilder<List<Map<String, dynamic>>>(
                            future: fetchImages(category),
                            builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                              if (snapshot.hasData) {
                                final List<Map<String, dynamic>> images = snapshot.data!;
                                return Row(
                                  children: images.map((image) {
                                    final String imageUrl = image['url'];
                                    final int imageId = image['id'];
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 15, top: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => DetailPage(id: imageId,),)
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image.network(
                                            imageUrl,
                                            width: 250,
                                            height: 250,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text('Error: ${snapshot.error}'),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: FutureBuilder<List<Map<String, dynamic>>>(
                            future: fetchImages2(category2),
                            builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                              if (snapshot.hasData) {
                                final List<Map<String, dynamic>> images = snapshot.data!;
                                return Row(
                                  children: images.map((image) {
                                    final String imageUrl = image['url'];
                                    final int imageId = image['id'];
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 15, top: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => DetailPage(id: imageId,),)
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image.network(
                                            imageUrl,
                                            width: 250,
                                            height: 250,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text('Error: ${snapshot.error}'),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: FutureBuilder<List<Map<String, dynamic>>>(
                            future: fetchImages3(category3),
                            builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                              if (snapshot.hasData) {
                                final List<Map<String, dynamic>> images = snapshot.data!;
                                return Row(
                                  children: images.map((image) {
                                    final String imageUrl = image['url'];
                                    final int imageId = image['id'];
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 15, top: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => DetailPage(id: imageId,),)
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image.network(
                                            imageUrl,
                                            width: 250,
                                            height: 250,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text('Error: ${snapshot.error}'),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: FutureBuilder<List<Map<String, dynamic>>>(
                            future: fetchImages4(category4),
                            builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                              if (snapshot.hasData) {
                                final List<Map<String, dynamic>> images = snapshot.data!;
                                return Row(
                                  children: images.map((image) {
                                    final String imageUrl = image['url'];
                                    final int imageId = image['id'];
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 15, top: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => DetailPage(id: imageId,),)
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image.network(
                                            imageUrl,
                                            width: 250,
                                            height: 250,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text('Error: ${snapshot.error}'),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
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
                          // onTap: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(builder: (context) => DetailPage(
                          //       // image: his[index],
                          //
                          //     ),),
                          //   ); // navigate to
                          // },
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