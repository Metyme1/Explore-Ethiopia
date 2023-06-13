import 'package:ethiopia/pages/bookmark.dart';
import 'package:ethiopia/pages/home_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    BookMark(),
    Calender(),
    MyPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(
          height: 56.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.apps),
                onPressed: () {
                  _onItemTapped(0);
                },
              ),
              IconButton(
                icon: Icon(Icons.bookmark),
                onPressed: () {
                  _onItemTapped(1);
                },
              ),
              SizedBox(width: 50.0),
              IconButton(
                icon: Icon(Icons.calendar_month),
                onPressed: () {
                  _onItemTapped(2);
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  _onItemTapped(3);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        child: SvgPicture.asset(
          'assets/ethiopia_shape.svg',
          width: 30,
          height: 30,
        ),
        onPressed: () {
          // Add your onPressed function here
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}