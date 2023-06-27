import 'package:flutter/material.dart';

class ImageModel {
  final String imageUrl;
  final String description;

  ImageModel(this.imageUrl, this.description);
}

class AlbumModel {
  final String albumName;
  final String thumbnailUrl;
  final List<ImageModel> images;

  AlbumModel(this.albumName, this.thumbnailUrl, this.images);
}

class Gallery extends StatelessWidget {
  final List<AlbumModel> albums = [
    AlbumModel(
      'My Museum',
      'images/categories/my musem/gasha.jpeg',
      [
        ImageModel(
          'images/categories/my musem/crown.jpeg',
          'Description for image 1',
        ),
        ImageModel(
          'images/categories/my musem/dress.jpeg',
          'Description for image 2',
        ),
        ImageModel(
          'images/categories/my musem/gasha.jpeg',
          'Description for image 3',
        ),
        ImageModel(
          'images/categories/my musem/jew.jpg',
          'Description for image 4',
        ),
        ImageModel(
          'images/categories/my musem/minilik caba.jpeg',
          'Description for image 5',
        ),
      ],
    ),
    AlbumModel(
      'Events',
      'images/categories/events/ireecha-1.jpg',
      [
        ImageModel(
          'images/categories/events/Eidalfitir.jpg',
          'Description for image 1',
        ),
        ImageModel(
          'images/categories/events/ireecha-1.jpg',
          'Description for image 2',
        ),
        ImageModel(
          'images/categories/events/Ketera1.jpg',
          'Description for image 3',
        ),
        ImageModel(
          'images/categories/events/meskel-3.jpeg',
          'Description for image 4',
        ),
        ImageModel(
          'images/categories/events/timket.jpg',
          'Description for image 5',
        ),
      ],
    ),
    AlbumModel(
      'Destinations',
      'images/categories/Hist&cal/Gondar3.png',
      [
        ImageModel(
          'images/categories/Hist&cal/lalibela.jpg',
          'Description for image 1',
        ),
        ImageModel(
          'images/categories/Hist&cal/lalibela.jpg',
          'Description for image 2',
        ),
        ImageModel(
          'images/categories/my musem/gasha.jpeg',
          'Description for image 3',
        ),
        ImageModel(
          'images/categories/Hist&cal/sof-omar-2.jpg',
          'Description for image 4',
        ),
        ImageModel(
          'images/categories/urban and rural/arbaminch.jpg',
          'Description for image 5',
        ),
      ],
    ),
    AlbumModel(
      'My Museum',
      'images/categories/my musem/crown.jpeg',
      [
        ImageModel(
          'images/categories/my musem/crown.jpeg',
          'Description for image 1',
        ),
        ImageModel(
          'images/categories/my musem/dress.jpeg',
          'Description for image 2',
        ),
        ImageModel(
          'images/categories/my musem/gasha.jpeg',
          'Description for image 3',
        ),
        ImageModel(
          'images/categories/my musem/jew.jpg',
          'Description for image 4',
        ),
        ImageModel(
          'images/categories/my musem/minilik caba.jpeg',
          'Description for image 5',
        ),
      ],
    ),
    AlbumModel(
      'My Museum',
      'images/categories/my musem/crown.jpeg',
      [
        ImageModel(
          'images/categories/my musem/crown.jpeg',
          'Description for image 1',
        ),
        ImageModel(
          'images/categories/my musem/dress.jpeg',
          'Description for image 2',
        ),
        ImageModel(
          'images/categories/my musem/gasha.jpeg',
          'Description for image 3',
        ),
        ImageModel(
          'images/categories/my musem/jew.jpg',
          'Description for image 4',
        ),
        ImageModel(
          'images/categories/my musem/minilik caba.jpeg',
          'Description for image 5',
        ),
      ],
    ),
    AlbumModel(
      'My Museum',
      'images/categories/my musem/crown.jpeg',
      [
        ImageModel(
          'images/categories/my musem/crown.jpeg',
          'Description for image 1',
        ),
        ImageModel(
          'images/categories/my musem/dress.jpeg',
          'Description for image 2',
        ),
        ImageModel(
          'images/categories/my musem/gasha.jpeg',
          'Description for image 3',
        ),
        ImageModel(
          'images/categories/my musem/jew.jpg',
          'Description for image 4',
        ),
        ImageModel(
          'images/categories/my musem/minilik caba.jpeg',
          'Description for image 5',
        ),
      ],
    ),
    AlbumModel(
      'My Museum',
      'images/categories/my musem/crown.jpeg',
      [
        ImageModel(
          'images/categories/my musem/crown.jpeg',
          'Description for image 1',
        ),
        ImageModel(
          'images/categories/my musem/dress.jpeg',
          'Description for image 2',
        ),
        ImageModel(
          'images/categories/my musem/gasha.jpeg',
          'Description for image 3',
        ),
        ImageModel(
          'images/categories/my musem/jew.jpg',
          'Description for image 4',
        ),
        ImageModel(
          'images/categories/my musem/minilik caba.jpeg',
          'Description for image 5',
        ),
      ],
    ),

    // Add more albums here
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        // appBar: AppBar(
        //   title: Text('Gallery'),
        //   backgroundColor: Colors.teal,
        // ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Albums',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(


              child: ListView.builder(
                itemCount: albums.length,
                itemBuilder: (context, index) {
                  final album = albums[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AlbumViewer(album: album)),
                      );
                    },
                    child: SizedBox(
                      height: 120,
                      child: Container(
                        color: Colors.black,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  album.thumbnailUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                album.albumName,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlbumViewer extends StatefulWidget {
  final AlbumModel album;

  AlbumViewer({required this.album});

  @override
  _AlbumViewerState createState() => _AlbumViewerState();
}

class _AlbumViewerState extends State<AlbumViewer> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  double _descriptionOffset = -double.infinity;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);
  }

  void _goBack() {
    setState(() {
      _currentIndex = (_currentIndex - 1) % widget.album.images.length;
      _descriptionOffset = -double.infinity;
      _animationController.reset();
    });
  }

  void _goForward() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % widget.album.images.length;
      _descriptionOffset = -double.infinity;
      _animationController.reset();
    });
  }

  void _handleVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _descriptionOffset -= details.delta.dy;
    });
  }

  void _handleVerticalDragEnd(DragEndDetails details) {
    if (_descriptionOffset < -100){
      // Swipe up to show description
      _animationController.forward();
    } else if (_descriptionOffset > 100) {
      // Swipe down to hide description
      _animationController.reverse();
    } else {
      // Snap back to original position
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.album.albumName),
        backgroundColor: Colors.black,
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _descriptionOffset = _descriptionOffset < 0 ? 0 : -double.infinity;
            _animationController.reverse();
          });
        },
        onVerticalDragUpdate: _handleVerticalDragUpdate,
        onVerticalDragEnd: _handleVerticalDragEnd,
        child: Stack(
          children: [
            PageView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: widget.album.images.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                  _descriptionOffset = -double.infinity;
                  _animationController.reset();
                });
              },
              itemBuilder: (context, index) {
                final imageModel = widget.album.images[index];
                return Image.asset(
                  imageModel.imageUrl,
                  fit: BoxFit.contain,
                );
              },
            ),
            // Positioned(
            //   top: 0,
            //   left: 0,
            //   right: 0,
            //   child: Container(
            //     color: Colors.black.withOpacity(0.5),
            //     child: Padding(
            //       padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           IconButton(
            //             icon: Icon(Icons.arrow_back),
            //             color: Colors.white,
            //             onPressed: _goBack,
            //           ),
            //           Text(
            //             widget.album.images[_currentIndex].description,
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 16,
            //             ),
            //           ),
            //           IconButton(
            //             icon: Icon(Icons.arrow_forward),
            //             color: Colors.white,
            //             onPressed: _goForward,
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == 0 ? Colors.white : Colors.grey,
                    ),
                  ),
                  Container(
                    width: 10,
                    height: 10,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == 1 ? Colors.white : Colors.grey,
                    ),
                  ),
                  Container(
                    width: 10,
                    height: 10,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == 2 ? Colors.white : Colors.grey,
                    ),
                  ),
                  Container(
                    width: 10,
                    height: 10,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == 3 ? Colors.white : Colors.grey,
                    ),
                  ),
                  Container(
                    width: 10,
                    height: 10,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == 4 ? Colors.white : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              top: _descriptionOffset,
              left: 0,
              right: 0,
              child: FadeTransition(
                opacity: _animation,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Text(
                      widget.album.images[_currentIndex].description,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}