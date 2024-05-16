import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailPage2 extends StatefulWidget {
  final String image;

  DetailPage2({required this.image});

  @override
  _DetailPage2State createState() => _DetailPage2State();
}

class _DetailPage2State extends State<DetailPage2> {
  // Define a mapping between the place and its corresponding set of images
  final Map<String, Map<String, dynamic>> places = {
    'images/categories/Hist&cal/lalibela.jpg': {
      'name': 'Lalibela',
      'description': 'Lalibela is a town in northern Ethiopia famous for its 11 rock-cut churches. The churches were built in the 12th and 13th centuries and are considered a masterpiece of Ethiopian art and engineering.',
      'location': [12.0291, 39.0440],
    },
    'images/categories/Hist&cal/fassil.jpg': {
      'name': 'Gonder',
      'description': 'Gondar, a city in northern Ethiopia, is a popular tourist attraction known for its rich history and unique architecture. The Royal Enclosure, a UNESCO World Heritage Site, houses impressive buildings such as Fasilides Castle and Iyasus Palace.',
      'location': [12.6092, 37.4665],
    },
    'images/categories/Hist&cal/sof-omar.jpg': {
      'name': 'Sof-omar',
      'description': 'Sof Omar is a natural cave system located in the Bale Zone of Ethiopia. It is one of the longest cave systems in Africa and the world, stretching for over 15 kilometers (9.3 miles). The cave system is named after a Muslim holy man named Sheikh Sof Omar, who is believed to have lived in the area during the 12th century.',
      'location': [6.8978, 40.6892],
    },
    'images/categories/landscapes/blue-1.jpg': {
      'name': 'Blue Nile(Abbay)',
      'description': 'The Abbay River is the main tributary of the Nile and is formed by the confluence of several smaller rivers that originate in the Ethiopian Highlands. The river flows through Ethiopia for over 1,400 km (870 miles), passing through several important cities such as Bahir Dar and Gondar, before entering Sudan..',
      'location': [11.9020, 37.5862],
    },
    'images/categories/landscapes/danakil-2.jpg': {
      'name': 'Danakil Depression',
      'description': 'The Danakil Depression is a desert basin located in the northeast of Ethiopia, near the border with Eritrea and Djibouti. It is one of the hottest, driest, and lowest places on earth, with daytime temperatures often exceeding 50°C (122°F).',
      'location': [14.2417, 40.2996],
    },
    'images/categories/landscapes/Simien_Mountain.jpg': {
      'name': 'Simen_Mountain',
      'description': 'The Simien Mountains in northern Ethiopia offer breathtaking views of dramatic peaks, deep valleys, and stunning waterfalls. Home to several unique species of flora and fauna, including the Ethiopian wolf and the gelada baboon, the mountains are a nature lovers paradise.',
      'location': [13.4500, 38.2167],
    }
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Retrieve the place name, description, and location from the mapping based on the selected image
    final place = places[widget.image];
    final name = place?['name'];
    final description = place?['description'];
    final location = place?['location'];

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
          Positioned(
          left: 20,
          top: 50,
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu),
                color: Colors.white,
              )
            ],
          ),
        ),
        Container(
          width: double.maxFinite,
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.image),
              fit: BoxFit.cover,
            ),
          ),

        ),
        Positioned(
          top: 280,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 280,
            padding: EdgeInsets.only(top: 50, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name ?? '',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    description ?? '',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  location != null
                      ? Container(
                    height: 300,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(location[0], location[1]),
                        zoom: 12,
                      ),
                      markers: {
                        Marker(
                          markerId: MarkerId(name ?? ''),
                          position:
                          LatLng(location[0], location[1]),
                        ),
                      },
                    ),
                  )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ),
        )
          ],
        ),
      ),
    );
  }
}