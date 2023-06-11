import 'package:ethiopia/cubit/app_cubit.dart';
import 'package:ethiopia/cubit/app_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

import 'package:intl/intl.dart';
class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 3;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context ,state){
      DetailState detail = state as DetailState;
    return Scaffold(
      bottomNavigationBar: const BottomAppBar(),
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
                    onPressed: () {
                      BlocProvider.of<AppCubits>(context).goHome();
                    },
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:NetworkImage(""+detail.place.img),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              top: 280,
              child: Container(
                padding:
                const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Gonder",//detail.place.name
                          style: TextStyle(color: Colors.black54, fontSize: 30),
                        ),
                        Text(
                          "\$ 250",// "\$"+detail.place.price.toString
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.black,
                        ),
                        Text(
                          "Gonder, Ethiopia",//detail.place.location
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Decription",
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text( // det
                      "This is the most incredible place I have ever seen in my life.",// detail.place.description
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    SizedBox(height: 25),
                    Text(
                      "Comments",
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            itemCount: 20, // Replace with your desired item count
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text('Item $index'),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Add a comment',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ),
                          child: Text('Add'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 130,
              right: 30,
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return TripPage();
                        },
                      );
                    },
                    child: Text('Book your trip now'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  });
}

}


class TripPage extends StatefulWidget {
  @override
  _TripPageState createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  late TextEditingController _startDateController;
  late TextEditingController _endDateController;
  late String _imageUrl;
  late double _price;
  late int _confirmationCode;

  @override
  void initState() {
    super.initState();
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
    _imageUrl = 'images/welcome-1.jpg';
    _price = 100.0;
    _confirmationCode = 0;
  }

  void _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null) {
      controller.text = DateFormat('MMM d, y').format(picked);
    }
  }

  void _generateConfirmationCode() {
    final rng = Random();
    final confirmationCode = rng.nextInt(9001) + 1000;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation Code'),
          content: Text('Your confirmation code is: $confirmationCode'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _confirmationCode = 0;
                });
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
    setState(() {
      _confirmationCode = confirmationCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
        title: Text('Trip Page'),
    ),
    body: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(16),
    bottomRight: Radius.circular(16),
    ),
    image: DecorationImage(
    image: AssetImage(_imageUrl),
    fit: BoxFit.cover,
    ),
    ),
    height: 200,
    ),
    SizedBox(height: 16),
    Text(
    'Trip Description',
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 8),
    Text(
    'This is a sample trip description. It contains information about the trip and the areas that will be visited.',
    style: TextStyle(fontSize: 16),
    ),
    SizedBox(height: 16),
    Text(
    'Price: $_price Birr',
    style: TextStyle(fontSize: 18),
    ),
    SizedBox(height: 16),
    Row(
    children: [
    Expanded(
    child: TextField(
    controller: _startDateController,
    decoration: InputDecoration(
    labelText: 'Start Date',
    suffixIcon: Icon(Icons.calendar_today),
    ),
    onTap: () => _selectDate(context, _startDateController),
    ),
    ),
    SizedBox(width: 16),
    Expanded(
    child: TextField(
    controller: _endDateController,
    decoration: InputDecoration(
    labelText: 'End Date',
    suffixIcon: Icon(Icons.calendar_today),
    ),
    onTap: () => _selectDate(context, _endDateController),
    ),
    ),
    ],
    ),
    SizedBox(height: 16),
    SizedBox(
    width: 200,
    child: ElevatedButton(
    onPressed: _generateConfirmationCode,
    child: Text('Send Confirmation Code to Pay Birr'),
    style: ElevatedButton.styleFrom(
    primary: Colors.brown,
    minimumSize: Size(50, 50),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(50),
    ),
    ),
    ),
    ),
    SizedBox(height: 32),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Text(
    'Related Images',
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
    ),
    SizedBox(height: 16),
    AspectRatio(
    aspectRatio: 1.5,
    child: GridView.count(
    crossAxisCount: 2,
    mainAxisSpacing: 8,
    crossAxisSpacing: 8,
    children: [
    Image.asset('images/welcome-1.jpg', fit: BoxFit.cover),
    Image.asset('images/welcome-2.jpg', fit: BoxFit.cover),
    Image.asset('images/welcome-3.jpg', fit: BoxFit.cover),
    Image.asset('images/welcome-1.jpg', fit: BoxFit.cover),

    ],
    ),
    ),
    ],
    ),
    ),
    )
    );
  }
}
