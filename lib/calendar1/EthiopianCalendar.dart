import 'GregorianCalendar.dart';
import '../utils/Bahirehasab.dart';
import '../utils/util.dart';

class EthiopianCalendar {
  int? year;
  int? month;
  int? day;
  String? holiday_name;
  bool isHoliday = false;
  String? month_name;
  String? day_name;

  EthiopianCalendar({this.year, this.month, this.day}) {
    this.month_name = months[this.month! - 1];
    this.holiday_name =
        getHoliday(months[this.month! - 1], this.day, this.year);
    this.isHoliday = holiday_name != "" ? true : false;
  }

  EthiopianCalendar.now() {
    var fixed = fixedFromUnix(DateTime.now().millisecondsSinceEpoch);
    this.year = ((4 * (fixed - ethiopicEpoch) + 1463) ~/ 1461);
    this.month = (((fixed - fixedFromEthiopic(this.year!, 1, 1)) ~/ 30) + 1);
    this.day = fixed + 1 - fixedFromEthiopic(this.year!, this.month!, 1);
    this.month_name = months[(this.month! - 1) % 13];
    this.holiday_name =
        getHoliday(months[this.month! - 1], this.day, this.year);
    this.isHoliday = holiday_name != "" ? true : false;

    var gc = this.toGC();
    this.day_name = dayss[getDayName(gc.month, gc.day, gc.year)];
  }

  GregorianCalendar toGC() {
    return new GregorianCalendar(
        year: DateTime.fromMillisecondsSinceEpoch(
            dateToEpoch(this.year!, this.month!, this.day!))
            .year,
        month: DateTime.fromMillisecondsSinceEpoch(
            dateToEpoch(this.year!, this.month!, this.day!))
            .month,
        day: DateTime.fromMillisecondsSinceEpoch(
            dateToEpoch(this.year!, this.month!, this.day!))
            .day);
  }

  EthiopianCalendar nextMonth() {
    var isLastMonth = this.month == 13 || (this.month == 12 && this.day! > 6);
    return new EthiopianCalendar(
        year: isLastMonth ? this.year! + 1 : this.year,
        month: isLastMonth ? 1 : this.month! + 1,
        day: this.day);
  }

  EthiopianCalendar previousMonth() {
    var isFirstMonth = this.month == 1;
    return new EthiopianCalendar(
        year: isFirstMonth ? this.year! - 1 : this.year,
        month: isFirstMonth ? (this.day! > 6 ? 12 : 13) : this.month! - 1,
        day: this.day);
  }

  EthiopianCalendar nextYear() {
    return EthiopianCalendar(
        year: this.year! + 1, month: this.month, day: this.day);
  }

  EthiopianCalendar currentDay() {
    return EthiopianCalendar(
        year: this.year!, month: this.month, day: this.day);
  }

  EthiopianCalendar previousYear() {
    return EthiopianCalendar(
        year: this.year! - 1, month: this.month, day: this.day);
  }

  int daysInMonth() {
    if (this.month == 13) {
      // In a leap year, the 13th month has 6 days
      return isLeapYear(this.year!) ? 6 : 5;
    } else {
      // All other months have 30 days
      return 30;
    }
  }

  bool isLeapYear(int year) {
    // Ethiopian leap year logic: Every 4 years except the year before the Gregorian leap year
    return (year % 4 == 3);
  }

  int firstDayOfWeek() {
    // Calculate the epoch day of the first day of the current month
    int epochDay = fixedFromEthiopic(year!, month!, 1) - 1;
    // The Ethiopic calendar has a 7-day week
    return (epochDay + 3) % 7;
  }
}

// thisYear() {
//   // return EthiopianCalendar(
//   //     year: this.year!, month: this.month, day: this.day);
//   String current_day = '$this.year : $this.month : $this.day';
//   return current_day;
// }



// int firstDayOfWeek() {
//   var epochDay = fixedFromEthiopic(this.year!, this.month!, 1) - 1;
//   // The Ethiopic calendar has a 7-day week
//   return (epochDay + 3) % 7;
// }