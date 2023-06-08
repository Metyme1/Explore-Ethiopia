// import 'package:flutter/material.dart';
// import 'package:abushakir/abushakir.dart';
// import 'package:jiffy/jiffy.dart';
//
// class EthiopianCalendarTable extends StatelessWidget {
//   final int year;
//
//   EthiopianCalendarTable({this.year});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Ethiopian Calendar $year'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 16.0),
//             Center(
//               child: Text(
//                 'Ethiopian Calendar $year',
//                 style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Table(
//               border: TableBorder.all(),
//               children: [
//                 TableRow(
//                   children: [
//                     TableCell(
//                       child: Center(child: Text('Month')),
//                     ),
//                     for (int i = 1; i <= 30; i++)
//                       TableCell(
//                         child: Center(child: Text('$i')),
//                       ),
//                   ],
//                 ),
//                 for (int month = 1; month <= 13; month++)
//                   TableRow(
//                     children: [
//                       TableCell(
//                         child: Center(child: Text(getMonthName(month))),
//                       ),
//                       for (int day = 1; day <= 30; day++)
//                         TableCell(
//                           child: Center(child: Text(getEthiopianDate(year, month, day))),
//                         ),
//                     ],
//                   ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   String getMonthName(int month) {
//     switch (month) {
//       case 1:
//         return 'Meskerem';
//       case 2:
//         return 'Tikimt';
//       case 3:
//         return 'Hidar';
//       case 4:
//         return 'Tahsas';
//       case 5:
//         return 'Tir';
//       case 6:
//         return 'Yekatit';
//       case 7:
//         return 'Megabit';
//       case 8:
//         return 'Miazia';
//       case 9:
//         return 'Genbot';
//       case 10:
//         return 'Sene';
//       case 11:
//         return 'Hamle';
//       case 12:
//         return 'Nehase';
//       case 13:
//         return 'Pagume';
//       default:
//         return '';
//     }
//   }
//
//   String getEthiopianDate(int year, int month, int day) {
//     if (month == 13 && day > 5) {
//       return /**
//               * Ethiopian Datetime Module [EtDatetime]
//               */
//         EtDatetime now = new EtDatetime.now(); // => 2012-07-28 17:18:31.466
//       print(now.date); // => {year: 2012, month: 7, day: 28}
//       print(now.time); // => {h: 17, m: 18, s: 31}
//
//       EtDatetime covidFirstConfirmed = new EtDatetime(year: 2012, month: 7, day: 4);
//       EtDatetime covidFirstConfirmedEpoch =
//       new EtDatetime.fromMillisecondsSinceEpoch(covidFirstConfirmed.moment);
//
//       EtDatetime covidFirstDeath = EtDatetime.parse("2012-07-26 23:00:00");
//
//       /// Comparison of two EtDatetime Instances
//       Duration daysWithOutDeath = covidFirstConfirmed.difference(covidFirstDeath);
//
//       assert(daysWithOutDeath.inDays == -22, true); // 22 days
//
//       assert(covidFirstDeath.isAfter(covidFirstConfirmed), true);
//
//       assert(covidFirstDeath.isBefore(now), true);
//
//       assert(covidFirstConfirmed.isAtSameMomentAs(covidFirstConfirmedEpoch), true);
//
//       /**
//        * Ethiopian Calendar Module [ETC]
//        */
//       ETC ethiopianCalendar = new ETC(year: 2012, month: 7, day: 4);
//
//       ///
//       print(ethiopianCalendar.monthDays(geezDay: true, weekDayName:true)); // Iterable Object of the given month
//       print(ethiopianCalendar.monthDays().toList()[0]); // => [2012, 7, ፩, አርብ]
//       // [year, month, dateNumber, dateNameIndex], Monday as First weekday
//
//       print(ethiopianCalendar.nextMonth); // => ETC instance of nextMonth, same year
//       print(ethiopianCalendar.prevYear); // => ETC instance of prevYear, same month
//
//       /**
//        * Bahire Hasab Module [BahireHasab]
//        */
//       BahireHasab bh = BahireHasab(year: 2011);
// //  BahireHasab bh = BahireHasab(); // Get's the current year
//
//       print(bh.getEvangelist(returnName: true)); // => ሉቃስ
//
//       print(bh.getSingleBealOrTsom("ትንሳኤ")); // {month: ሚያዝያ, date: 20}
//
//       bh.allAtswamat; // => List of All fasting and Movable holidays
//
//       /**
//        * Arabic or English number (1,2,3...) to Ethiopic or GE'EZ (፩, ፪, ፫...) number Converter
//        */
//
//       var input= [1, 10, 15, 20, 25, 78, 105, 333, 450, 600, 1000, 1001, 1010, 1056, 1200, 2013, 9999, 10000];
//
//       for (var arabic in input) {
//         print(ConvertToEthiopic(arabic)); // [፩, ፲, ፲፭, ፳, ፳፭, ፸፰, ፻፭, ፫፻፴፫, ፬፻፶, ፮፻, ፲፻, ፲፻፩, ፲፻፲, ፲፻፶፮, ፲፪፻, ፳፻፲፫, ፺፱፻፺፱, ፻፻]
//       }
//
//       /*
//    * Conversion from any calendar (in this case, Gregorian) into Ethiopian Calendar.
//    */
//       DateTime gregorian1 = new DateTime.now();
//       EtDatetime ethiopian1 = new EtDatetime.fromMillisecondsSinceEpoch(gregorian1.millisecondsSinceEpoch);
//
//       print("Gregorian := ${gregorian1.toString()} is equivalent to Ethiopian ${ethiopian1.toString()}");
//       // Gregorian := 2020-09-22 23:36:37.042962 is equivalent to Ethiopian 2013-01-12 20:36:37.042
//       /*
//     * Conversion from Ethiopian Calendar into any calendar (in this case, Gregorian).
//     */
//       EtDatetime ethiopian = new EtDatetime.now();
//       DateTime gregorian = new DateTime.fromMillisecondsSinceEpoch(ethiopian.moment);
//
//       print("Ethiopian ${ethiopian.toString()} is equivalent to Gregorian := ${gregorian.toString()}");
//       // Ethiopian 2013-01-12 20:36:37.044 is equivalent to Gregorian := 2020-09-22 23:36:37.044
//
//       print("Ethiopian EPOCH := ${ethiopian.moment}"); // Ethiopian EPOCH := 1600806997044
//       print("Gregorian EPOCH := ${gregorian.millisecondsSinceEpoch}"); // Gregorian EPOCH := 1600806997044;
//     }
//     int jd = Abushakir(year, month, day).toJd();
//     DateTime gregorianDate = Jiffy().julianDay(jd).gregorianDate;
//     return '${gregorianDate.month}/${gregorianDate.day}/${gregorianDate.year}';
//   }
// }