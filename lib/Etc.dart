import 'package:flutter/material.dart';
import 'package:ethiopia/calendar1/GregorianCalendar.dart';
import 'calendar1/EthiopianCalendar.dart';
import 'screens/home_page.dart';
import 'screens/converter.dart';

class CalendarPagep extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPagep> {
  EthiopianCalendar _calendar = EthiopianCalendar.now();
  List<String> _weekdayNames = [
    'እሁድ',
    'ሰኞ',
    'ማክሰኞ',
    'ረቡዕ',
    'ሐሙስ',
    'ዓርብ',
    'ቅዳሜ',
  ];

  List<Widget> _buildDayCells() {
    List<Widget> cells = [];
    int daysInMonth = _calendar.daysInMonth();
    int firstDayOfWeek = (_calendar.firstDayOfWeek() % 7); // Adjust for zero-indexed weekday

    // Add weekday headers
    for (int i = 0; i < 7; i++) {
      cells.add(
        Padding(
          padding: const EdgeInsets.all(2),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Center(
              child: Text(
                _weekdayNames[i],
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );
    }

    // Add empty cells for previous month's days
    for (int i = 0; i < firstDayOfWeek; i++) {
      cells.add(
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1),
            color: Colors.transparent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(''),
            ],
          ),
        ),
      );
    }

    // Add cells for each day of the current month
    for (int i = 1; i <= daysInMonth; i++) {
      EthiopianCalendar date = EthiopianCalendar(
        year: _calendar.year,
        month: _calendar.month,
        day: i,
      );

      GregorianCalendar gcDate = date.toGC();
      String gcDay = gcDate.day.toString();

      cells.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _calendar = date;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: date.isHoliday ? Colors.brown : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$i',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: date.isHoliday ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  gcDay,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Add empty cells for next month's days to fill the grid
    int totalCells = cells.length;
    int remainingCells = 49 - totalCells;
    for (int i = 1; i <= remainingCells; i++) {
      cells.add(
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1),
            color: Colors.transparent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(''),
            ],
          ),
        ),
      );
    }

    return cells;
  }

  List<EthiopianCalendar> _getMonthHolidays() {
    List<EthiopianCalendar> holidays = [];
    int daysInMonth = _calendar.daysInMonth();

    for (int i = 1; i <= daysInMonth; i++) {
      EthiopianCalendar date = EthiopianCalendar(
        year: _calendar.year,
        month: _calendar.month,
        day: i,
      );
      if (date.isHoliday) {
        holidays.add(date);
      }
    }

    return holidays;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Center(child: Text('Ethiopian Calendar')),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.compare_arrows),
            onPressed: () {
              Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CalendarConverter()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      _calendar = _calendar.previousMonth();
                    });
                  },
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  splashRadius:20,
                  iconSize: 30,
                  color: Colors.black,
                ),
              ),
              Text(
                '${_calendar.month_name} ${_calendar.year}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: "TimesNewRoman"
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    setState(() {
                      _calendar = _calendar.nextMonth();
                    });
                  },
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  splashRadius: 20,
                  iconSize: 30,
                  color: Colors.black,
                ),
              ),

            ],
          ),
          SizedBox(height: 20,),
          SizedBox(height: 16),
          GridView.count(
            padding: EdgeInsets.all(8.0),
            shrinkWrap: true,
            crossAxisCount: 7,
            childAspectRatio: 1,
            crossAxisSpacing: 2,
            children: _buildDayCells(),
          ),
          SizedBox(height: 16),

          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: _getMonthHolidays().length,
                itemBuilder: (BuildContext context, int index) {
                  EthiopianCalendar holiday = _getMonthHolidays()[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 9,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 60,
                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                          decoration: BoxDecoration(

                            border: Border(
                              right: BorderSide(
                                color: Colors.brown,
                                width: 6,
                              ),
                            ),
                          ),
                          child: Text(
                            '${holiday.day}',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${holiday.holiday_name}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),

    );
  }
}
