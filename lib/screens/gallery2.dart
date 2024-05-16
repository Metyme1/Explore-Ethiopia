import 'package:easy_localization/easy_localization.dart';
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
      'Ancient Materials'.tr(),
      'images/categories/my musem/gasha.jpeg',
      [
        ImageModel(
          'images/categories/my musem/4M0R8D6_image_crop_134215.jpeg',
          'Description for image 1',
        ),
        ImageModel(
          'images/categories/my musem/dress.jpeg',
          'Description for image 2',
        ),
        ImageModel(
          'images/categories/my musem/tesure.jpeg',
          'Description for image 3',
        ),
        ImageModel(
          'images/categories/my musem/4O1SZO3_copyright_image_137301.jpeg',
          'Description for image 4',
        ),
        ImageModel(
          'images/categories/my musem/;ion-2.jpg',
          'Description for image 5',
        ),
      ],
    ),
    AlbumModel(
      'Religious ceremonies'.tr(),
      'images/categories/events/meskel-3.jpeg',
      [
        ImageModel(
          'images/categories/events/Eidalfitir.jpg',
          'Description for image 1',
        ),
        ImageModel(
          'images/categories/events/Meskel-Demera-_-EBC-_-Ethiopia.webp',
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
      'Destinations'.tr(),
      'images/categories/Hist&cal/Gondar3.png',
      [
        ImageModel(
          'images/categories/Hist&cal/lalibela.jpg',
          'Description for image 1',
        ),
        ImageModel(
          'images/categories/Hist&cal/deberdamo-3.jpg',
          'Description for image 2',
        ),
        ImageModel(
          'images/categories/Hist&cal/debere damo-2.jpg',
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
        ImageModel(
          'images/categories/Hist&cal/fassil.jpg',
          'Description for image 5',
        ),
        ImageModel(
          'images/categories/Hist&cal/axum.jpg',
          'Description for image 5',
        ),
      ],
    ),

    AlbumModel(
      'Events'.tr(),
      'images/categories/events/ireecha-1.jpg',
      [
        ImageModel(
          'images/categories/events/Ashenda_2.jpg',
          'Description for image 1',
        ),
        ImageModel(
          'images/categories/events/irrecha.jpg',
          'Description for image 2',
        ),
        ImageModel(
          'images/categories/events/09290-BIG.jpg',
          'Description for image 3',
        ),
        ImageModel(
          'images/categories/events/thumbs_b2_8d060efd908e3f94dcc1a4220a739a3c.jpg',
          'Description for image 4',
        ),
        // ImageModel(
        //   'images/categories/my musem/minilik caba.jpeg',
        //   'Description for image 5',
        // ),
      ],
    ),
    AlbumModel(
      'cultural Clothes',
      'images/categories/cloths/oromo.jpg',
      [
        ImageModel(
          'images/categories/cloths/Burgendy-Crowning-Kaba-Set-2-1.jpg',
          'Description for image 1',
        ),
        ImageModel(
          'images/categories/cloths/afar.webp',
          'Description for image 2',
        ),
        ImageModel(
          'images/categories/cloths/afaab8c3-0b41-4ab7-a1a4-e6271c00294c_16x9_1200x676.webp',
          'Description for image 3',
        ),
        ImageModel(
          'images/categories/cloths/_114977887_1914c764-da6c-4443-b539-fdbb22240ad5.jpg',
          'Description for image 4',
        ),
        ImageModel(
          'images/categories/cloths/3fa5b09f5421b032f1c5645edb14b15b.jpg',
          'Description for image 5',
        ),
        ImageModel(
          'images/categories/cloths/_114977887_1914c764-da6c-4443-b539-fdbb22240ad5.jpg',
          'Description for image 5',
        ),
        ImageModel(
          'images/categories/cloths/Visit Ethiopia-63a9c7c78f7589.78354314.jpg',
          'Description for image 5',
        ),
      ],
    ),


    // Add more albums here
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Albums',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        elevation: 0, // remove the underline
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
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
                  color: Colors.white,
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
                            color: Colors.teal,
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