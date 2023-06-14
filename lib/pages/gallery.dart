import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final List<String> _photos = [
    'images/events/eidalfitir.jpg',
    'images/welcome-3.jpg',
    'images/welcome-1.jpg',
    'images/Cloths.jpg',
    'images/asenda.png',
    'images/ireecha-1.jpg',
    'images/ireecha-3.jpg',
    'images/eth.jpg',
    'images/temket.jpg',
  ];

  void _shufflePhotos() {
    setState(() {
      _photos.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.75,
        ),
        itemCount: _photos.length,
        itemBuilder: (context, index) {
          return Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                _photos[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _shufflePhotos,
        tooltip: 'Shuffle Photos',
        child: const Icon(Icons.shuffle),
      ),
    );
  }
}


