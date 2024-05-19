import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../widget/app_large_text.dart';
import 'detailPage2.dart';
import 'detail_page.dart';
import 'explore.dart';
import 'google_signin.dart';
import 'main_page.dart';



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
    "images/categories/landscapes/blue-1.jpg",
    "images/categories/landscapes/danakil-2.jpg",
    "images/categories/landscapes/Simien_Mountain.jpg",

  ];



  final List<String> names = [
    "Lalibela",
    "Gonder",
    "sof-omar",
    "Blue Nile",
    "Danakil",
    "Simien_Mountain",
  ];
  final List<String> locations= [
    " North Wollo",
    " Amhara",
    "East of Ginnir",
    "Tigray Region ",
    "Afar Region",
    "Amhara Region",
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0), // Set the height of the AppBar
          child: AppBar(
            backgroundColor: Colors.brown, // Set the background color of the AppBar
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(

              ),
            ),

            title:Text(
                'Discover'.tr(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30, // Set the font size of the title
                  fontWeight: FontWeight.bold,
                  fontFamily:"TimesNewRoman"
                ),
              ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(user.photoURL!) as ImageProvider<Object>,
                ),
              ),
            ],

            ),
          ),


      body:SingleChildScrollView(

            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        labelPadding: const EdgeInsets.only(left: 20, right: 20,),
                        controller: _tabController,
                        labelColor: Colors.brown,
                        unselectedLabelColor: Colors.grey,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: CircleTabIndicator(color: Colors.brown, radius: 5),
                        tabs: [
                          Tab(text: "Historical and cultural places".tr()),
                          Tab(text: "Religious".tr()),
                          Tab(text: "landscapes".tr()),
                          Tab(text: "Hotel and resorts".tr()),
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
                      child: AppLargeText(text: "Popular sites".tr(), size: 22, color: Colors.brown),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          images.length,
                              (index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage2(
                                    image: images[index], // Pass the image asset path as a parameter
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: Container(
                                width: 200,
                                margin: const EdgeInsets.only(right: 20),
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
                                      height: 200,
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
                                      text: names[index].tr(),
                                      color: Colors.black87,
                                      size: 18,
                                      weight: FontWeight.bold,
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: 5),
                                            AppText(
                                              text:locations[index].tr(),
                                              color: Colors.grey,
                                              size: 16,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )

                ]
            ),


      ),



        drawer: Drawer(
          child: Container(
            color: Colors.brown[800],
            child: Column(
              children: <Widget>[
                Container(
                  height: 230,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                    gradient: LinearGradient(
                      colors: [Colors.brown, Colors.brown[700]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(user.photoURL!) as ImageProvider<Object>,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Hello, ${user.displayName}".tr(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: "TimesNewRoman"
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                _buildListTile(
                  icon: Icons.home,
                  title: 'Home',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  },
                ),
                _buildListTile(
                  icon: Icons.person,
                  title: 'Developers',
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isDismissible: true,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return Align(
                          alignment: Alignment.centerRight,
                          child: FractionallySizedBox(
                            widthFactor: 0.8,
                            child: NotificationsBottomSheet(),
                          ),
                        );
                      },
                    );
                  },
                ),
                _buildListTile(
                  icon: Icons.settings,
                  title: 'Settings',
                  onTap: () {
                    // Add your Settings page navigation here
                  },
                ),
                _buildListTile(
                  icon: Icons.help,
                  title: 'Help',
                  onTap: () {
                    // Add your Help page navigation here
                  },
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: _buildListTile(
                      icon: Icons.logout,
                      title: 'Logout',
                      onTap: () {
                        final provider = Provider.of<GoogleSign>(context, listen: false);
                        provider.logout();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Explore()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
  );

  }
}
Widget _buildListTile({required IconData icon, required String title, required Function() onTap}) {
  return ListTile(
    leading: Icon(
      icon,
      color: Colors.white,
    ),
    title: Text(
      title.tr(),
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
    onTap: onTap,
  );
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

class NotificationsBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        color: Colors.brown[800],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Developers',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              color: Colors.white54,
              thickness: 1,
              indent: 30,
              endIndent: 30,
              height: 40,
            ),
            SizedBox(height: 10),
            _buildDeveloperInfo('Mety Million'),
            _buildDeveloperInfo('Beamlak Tadesse'),
            _buildDeveloperInfo('Bisrat Yared'),
            _buildDeveloperInfo('Matyas Sina'),
          ],
        ),
      ),
    );
  }

  Widget _buildDeveloperInfo(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        name,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
