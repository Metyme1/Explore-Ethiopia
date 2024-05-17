import 'package:flutter/material.dart';

import '../Etc.dart';
import '../calendar1/EthiopianCalendar.dart';
import '../calendar1/GregorianCalendar.dart';


enum CalendarMode { ecToGc, gcToEc }

class CalendarConverter extends StatefulWidget {
  @override
  _CalendarConverterState createState() => _CalendarConverterState();
}

class _CalendarConverterState extends State<CalendarConverter> {
  TextEditingController _yearController = TextEditingController();
  TextEditingController _monthController = TextEditingController();
  TextEditingController _dayController = TextEditingController();
  CalendarMode _selectedMode = CalendarMode.ecToGc;
  String _convertedResult = '';

  void convert() {
    int year = int.tryParse(_yearController.text) ?? 0;
    int month = int.tryParse(_monthController.text) ?? 0;
    int day = int.tryParse(_dayController.text) ?? 0;

    if (_selectedMode == CalendarMode.ecToGc) {
      // Convert Ethiopian Calendar (EC) to Gregorian Calendar (GC)
      var ec = EthiopianCalendar(year: year, month: month, day: day);
      var gc = ec.toGC();
      _convertedResult =
      'Converted to GC:${gc.month_name}, ${gc.day},${gc.year!}';
    } else {
      // Convert Gregorian Calendar (GC) to Ethiopian Calendar (EC)
      var gc = GregorianCalendar(year: year, month: month, day: day);
      var ec = gc.toEc();
      _convertedResult =
      'Converted to EC: ${ec.year!}, ${ec.month_name}, ${ec.day!+1}';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.brown,
        title: Text('Date converter'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => CalendarPagep()),
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),

            Text(
              'Select Conversion:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            DropdownButton<CalendarMode>(
              value: _selectedMode,
              onChanged: (mode) {
                setState(() {
                  _selectedMode = mode!;
                });
              },
              items: [
                DropdownMenuItem(
                  value: CalendarMode.ecToGc,
                  child: Text(
                    'Ethiopian Calendar to Gregorian Calendar',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                DropdownMenuItem(
                  value: CalendarMode.gcToEc,
                  child: Text(
                    'Gregorian Calendar to Ethiopian Calendar',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Text(
              'Enter the date to convert:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _dayController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Day',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: TextFormField(
                    controller: _monthController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Month',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: TextFormField(
                    controller: _yearController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Year',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Center(
              child: ElevatedButton(
                onPressed: convert,
                child: Text(
                  'Convert',
                  style: TextStyle(fontSize: 16.0),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              _convertedResult,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
                fontStyle: FontStyle.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}