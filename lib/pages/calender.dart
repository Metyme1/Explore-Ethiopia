import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EthiopianCalendar extends StatefulWidget {
  @override
  _EthiopianCalendarState createState() => _EthiopianCalendarState();
}

class _EthiopianCalendarState extends State<EthiopianCalendar> {
  final List<String> _ethiopianMonths = [
    'Meskerem',
    'Tikimt',
    'Hidar',
    'Tahsas',
    'Tir',
    'Yekatit',
    'Megabit',
    'Miazia',
    'Ginbot',
    'Sene',
    'Hamle',
    'Nehase',
    'Pagume'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ethiopian Calendar'),
      ),
      body: Center(
        child: _buildTable(),
      ),
    );
  }

  Widget _buildTable() {
    // Get the current Ethiopian year and month
    final ethiopianNow = DateFormat('yyyy-MM-dd', 'en_US')
        .format(DateTime.now().toUtc().add(Duration(hours: 3)));
    final currentEthiopianYear = int.parse(ethiopianNow.split('-')[0]);
    final currentEthiopianMonth = int.parse(ethiopianNow.split('-')[1]);

    // Calculate the number of days in each month
    final List<int> _ethiopianMonthDays = [
      30, // Meskerem
      30, // Tikimt
      30, // Hidar
      30, // Tahsas
      30, // Tir
      30, // Yekatit
      30, // Megabit
      30, // Miazia
      30, // Ginbot
      30, // Sene
      30, // Hamle
      5, // Nehase
      6, // Pagume
    ];

    // Calculate the starting date for each month in the year
    List<List<int>> _ethiopianMonthStartDays = List.generate(
        13,
            (i) =>
        [(currentEthiopianYear - 1) * 365 + (currentEthiopianYear - 1) ~/ 4 +
            1 +
            209 +
            i * 30,
          i]);

    // Add an extra day for leap years
    for (int i = 0; i < 13; i++) {
      if ((currentEthiopianYear % 4) == 0 && i > 0) {
        _ethiopianMonthStartDays[i][0]++;
      }
    }

    // Calculate the dates for each month in the year
    List<List<List<String>>> _ethiopianDates = List.generate(
        13,
            (i) => List.generate(
            6,
                (j) => List.generate(7, (k) {
              int _ethiopianDay = _ethiopianMonthStartDays[i][0] + j * 7 + k;
              if (_ethiopianDay > _ethiopianMonthDays[i]) {
                return '';
              } else {
                return _ethiopianDay.toString();
              }
            })));


    // Create the table for the year
    return ListView.builder(
        itemCount: 13,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                child: Text(
                  _ethiopianMonths[index] + ' ' + currentEthiopianYear.toString(),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Table(
                columnWidths: {
                  0: FractionColumnWidth(0.14),
                  1: FractionColumnWidth(0.14),
                  2: FractionColumnWidth(0.14),
                  3: FractionColumnWidth(0.14),
                  4: FractionColumnWidth(0.14),
                  5: FractionColumnWidth(0.14),
                  6: FractionColumnWidth(0.14),
                },
                children: [
                  TableRow(
                    children: [
                      _buildTableCell('Sun'),
                      _buildTableCell('Mon'),
                      _buildTableCell('Tue'),
                      _buildTableCell('Wed'),
                      _buildTableCell('Thu'),
                      _buildTableCell('Fri'),
                      _buildTableCell('Sat'),
                    ],
                  ),
                  for (int i = 0; i < 6; i++)
                    TableRow(
                      children: [
                        _buildTableCell(_ethiopianDates[index][i][0]),
                        _buildTableCell(_ethiopianDates[index][i][1]),
                        _buildTableCell(_ethiopianDates[index][i][2]),
                        _buildTableCell(_ethiopianDates[index][i][3]),
                        _buildTableCell(_ethiopianDates[index][i][4]),
                        _buildTableCell(_ethiopianDates[index][i][5]),
                        _buildTableCell(_ethiopianDates[index][i][6]),
                      ],
                    ),
                ],
              ),
            ],
          );
        });
  }

  Widget _buildTableCell(String text) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}