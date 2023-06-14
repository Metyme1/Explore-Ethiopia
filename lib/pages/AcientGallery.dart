import 'package:flutter/material.dart';

// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Event Gallery',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: EventGallery(),
//     );
//   }
// }

class EventGallery extends StatelessWidget {
  final List<String> images = [
"images/categories/my musem/crown1.jpeg",
    'images/categories/my musem/dress.jpeg',
    'images/categories/my musem/jew.jpg',
    'images/categories/my musem/jew-2.jpeg',
    'images/categories/my musem/jew-3.jpeg',
    'images/categories/my musem/jew-4.jpeg',
    'images/categories/my musem/minilik caba.jpeg',
    'images/categories/my musem/muse-5.jpg',
    'images/categories/my musem/tseure.jpeg',
    'images/categories/my musem/gasha.jpeg',
    'images/categories/my musem/1.webp',
  ];

  final List<String> descriptions = [
    'crown   ',
    'dress 2',
    'dress 3',
    'dress 4',
    'dress 5',
    'dress 6',
    'dress 7',
    'dress 8',
    'dress 9',
    'dress 10',
    'dress 10',
  ];

  final List<String> name = [
    'crown   ',
    'dress 2',
    'dress 3',
    'dress 4',
    'dress 5',
    'dress 6',
    'dress 7',
    'dress 8',
    'dress 9',
    'dress 10',
    'dress 10',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ancient Gallery'),
        backgroundColor: Colors.brown
      ),
      body: GridView.builder(
        itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {

            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: Icon(Icons.info),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text('Event Details'),
                                  contentPadding: EdgeInsets.symmetric(vertical: 24.0),
                                  content: Container(
                                    height: 200.0, // set the height of the container
                                    child: Text(descriptions[index]),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                     name[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}