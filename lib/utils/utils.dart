
import 'package:flutter/material.dart';

import '../calendar1/EthiopianCalendar.dart';
import '../calendar1/GregorianCalendar.dart';

Color getColorFromHex(String hex) {
  return Color(int.parse(hex.substring(1, 7), radix: 16) + 0xFF000000);
}

List<EthiopianCalendar> getMonth(int month, int year) {
  List<EthiopianCalendar> ecs = [];

  for (int i = 1; i < 31; i++) {
    ecs.add(EthiopianCalendar(year: year, month: month, day: i));
  }
  return ecs;
}

List<EthiopianCalendar> getCurrentMonth() {
  var gc = GregorianCalendar.now();
  var now = gc.toEc();
  List<EthiopianCalendar> ecs = [];

  for (int i = 1; i < 31; i++) {
    ecs.add(EthiopianCalendar(year: now.year, month: now.month, day: i));
  }
  return ecs;
}