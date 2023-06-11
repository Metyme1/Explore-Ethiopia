import 'package:flutter/material.dart';

class Cloth extends StatelessWidget {
  final List<Map<String, dynamic>> _items = [
    {
      'name': 'Red T-Shirt',
      'description': 'Afar',
      'images': [
        'images/11.jpg',
        'images/11.jpg',
        'images/11.jpg',
      ],
    },
    {
      'name': 'Blue Hoodie',
      'description': 'Warm and cozy blue hoodie',
      'images': [
        'images/11.jpg',
        'images/11.jpg',
        'images/11.jpg',
      ],
    },
    {
      'name': 'Black Jeans',
      'description': 'Slim-fit black jeans',
      'images': [
        'images/11.jpg',
        'images/11.jpg',
        'images/11.jpg',
      ],
    },
    {
      'name': 'White Sneakers',
      'description': 'Classic white sneakers',
      'images': [
        'images/11.jpg',
        'images/11.jpg',
        'images/11.jpg',
      ],
    },
    {
      'name': 'Green Jacket',
      'description': 'Water-resistant green jacket',
      'images': [
        'images/11.jpg',
        'images/11.jpg',
        'images/11.jpg',
        'images/11.jpg',
        'images/11.jpg',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clothing Store'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _items[index]['images'].length,
                    itemBuilder: (BuildContext context, int imageIndex) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Image.asset(
                          _items[index]['images'][imageIndex],
                          fit: BoxFit.cover,
                          width: 200,
                          height: 200,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _items[index]['name'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        _items[index]['description'],
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}