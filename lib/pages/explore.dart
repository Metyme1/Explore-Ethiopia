import 'package:ethiopia/pages/main_page.dart';
import 'package:ethiopia/widget/app_large_text.dart';
import 'package:ethiopia/widget/app_text.dart';
import 'package:ethiopia/widget/explore_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final String _image =     "images/categories/Hist&cal/sof-omar.jpg";
  String _selectedOption = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(

            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: DropdownButton<String>(
              value: _selectedOption,
              items: <String>[
                'English',
                'Arabic',
                'France',
              ].map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOption = newValue!;
                });
                // Handle the selection
              },
            ),
          ),
          Positioned.fill(
            bottom: 100,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppLargeText(
                    text: "Welcome",
                    color: Colors.white,
                  ),
                  AppText(
                    text: "to Ethiopia",
                    size: 30,
                    color: Colors.white,
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: AppText(
                      text:
                      "The magic of Ethiopia challenges preconceptions and defies expectations, beckoning visitors to explore its mysteries and discover its secrets.",
                      color: Colors.white,
                      size: 14,
                      //textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage(),)
                      );
                    },

                    child: Text("Explore more"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      fixedSize: MaterialStateProperty.all<Size>(Size(300, 50)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}