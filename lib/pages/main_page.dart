import 'package:ethiopia/pages/home_page.dart';
import 'package:ethiopia/pages/calender.dart';
import 'package:flutter/material.dart';

import 'exchange.dart';
import 'my_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    Exchange(),
    EthiopianCalendar(),
    MyPage()
  ];
  int currentIndex=0;



  void onTap(int index){
    setState(() {
      currentIndex =index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type:BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation:0,

        items: [
          BottomNavigationBarItem(label:"Home",icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label:"chart",icon:Icon(Icons.currency_exchange)),
          BottomNavigationBarItem(label:"Calnder",icon: Icon(Icons.calendar_month)),
          BottomNavigationBarItem(label:"profile",icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}