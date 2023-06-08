import 'dart:math';
import 'package:ethiopia/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Trip Details'),
          backgroundColor: Colors.brown,

        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailPage()),
            );
          },

        ),
      ),
      backgroundColor: Colors.white,
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
              width: 100,
              child: ElevatedButton(
                onPressed: _generateConfirmationCode,
                child: Text('Send Confirmation Code to Pay Birr'),
                style: ElevatedButton.styleFrom(
                primary: Colors.brown,
                  minimumSize: Size(50, 50),
                shape: RoundedRectangleBorder(

                  borderRadius: BorderRadius.circular(50), // set the border radius of the button
                ),
              ),),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

