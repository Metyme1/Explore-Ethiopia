import 'dart:core';

import 'package:ethiopia/pages/AcientGallery.dart';
import 'package:ethiopia/pages/currency.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/app_large_text.dart';
import 'detail_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final user=FirebaseAuth.instance.currentUser!;
  late TabController _tabController;
  bool _isBookmarked = false;

  final List<String> images = [
    "images/categories/Hist&cal/lalibela.jpg",
    "images/categories/Hist&cal/fassil.jpg",
    "images/categories/Hist&cal/sof-omar.jpg",
    "images/categories/religious/al-negash.jpg",
    "images/categories/urban and rural/gurage.jpeg",
    "images/categories/urban and rural/kuriftu.jpg",

  ];
  final List<String> names = [
    "Lalibela",
    "Gonder",
    "sof-omar",
    "al Negash",
    "gurage",
    "Kuriftu",
  ];
  final List<String> locations= [
    " North Wollo",
    " Amhara",
    "East of Ginnir",
    "Tigray Region ",
    "Gurage Zone",
    "Deberzyit",
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
      drawer:Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 300, // Set the height to your desired value
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.teal,
                ),
                // child: Image.asset(
                //   "images/categories/Hist&cal/lalibela.jpg",
                //   width: 100,
                //   height: 100,
                // ),
                child: Text(""),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            ListTile(
              leading: Icon(Icons.currency_exchange),
              title: Text('Currency Exchange Info'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Currency()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.business),
              title: Text('business Directories'),
              onTap: () {
                // Update the UI based on the selection.
              },
            ),
            ListTile(
              leading: Icon(Icons.browse_gallery),
              title: Text('Ancient gallery'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventGallery()),
                );
              },
            ),
          ],
        ),
      ),
     body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Container(
              padding: const EdgeInsets.only(top: 70, left: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer(); // Open the drawer
                    },
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
                    Tab(text: "Wildlife and nature"),
                    Tab(text: "Arts and crafts"),
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
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigate to the category detail page
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 15, top: 10),
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage(
                                "images/categories/Hist&cal/lalibela.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 60,
                                      left: 150,
                                      child: IconButton(
                                        icon: Icon(
                                          _isBookmarked
                                              ? Icons.bookmark
                                              : Icons.bookmark_outline,
                                          color: _isBookmarked ? Colors.red : Colors.white,
                                        ),
                                        onPressed: _toggleBookmark,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 10,
                                      left: 10,
                                      child: AppText(
                                        text: "Lalibela",
                                        color: Colors.teal,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      right: 10,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => DetailPage()),
                                          );
                                        },
                                        child: Icon(
                                          Icons.info_outline,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
                  // Navigate to the explore page
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
                              Icon(
                                Icons.location_on,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 5),
                              AppText(
                                text:locations[index],
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
              );
            },
          ),
        )
]

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