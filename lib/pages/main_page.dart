import 'package:flutter/material.dart';

import 'bookmark.dart';
import 'calender.dart';
import 'home_page.dart';
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
    BookmarkPage(),
    Calender(),
    MyPage()
  ];

  Widget _buildFloatingActionButton() {
    switch (_selectedIndex) {
      case 0:
        return FloatingActionButton(
          backgroundColor: Colors.brown,
          child: Icon(Icons.travel_explore),
          onPressed: () {
            // Add your onPressed function here
          },
        );
      case 1:
        return FloatingActionButton(
          backgroundColor: Colors.brown,
          child: Icon(Icons.bookmark_added_rounded),
          onPressed: () {
            // Add your onPressed function here
          },
        );
      case 2:
        return FloatingActionButton(
          backgroundColor: Colors.brown,
          child: Icon(Icons.calendar_month),
          onPressed: () {
            // Add your onPressed function here
          },
        );
      case 3:
        return FloatingActionButton(
          backgroundColor: Colors.brown,
          child: Icon(Icons.person),
          onPressed: () {
            // Add your onPressed function here
          },
        );
      default:
        return Container();
    }
  }

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
                icon: Icon(Icons.travel_explore),
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
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}