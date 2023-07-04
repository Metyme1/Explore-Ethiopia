import 'package:easy_localization/easy_localization.dart';
import 'package:ethiopia/pages/main_page.dart';
import 'package:ethiopia/widget/app_large_text.dart';
import 'package:ethiopia/widget/app_text.dart';
import 'package:ethiopia/widget/explore_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'google_signin.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final String _image =     "images/categories/Hist&cal/sof-omar.jpg";
  String _selectedOption = 'English';
  String _selectedLanguage = 'en';
bool isclicked=false;
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
          ),Positioned(
            top: 40,
            right: 20,
            child: DropdownButton<String>(
              value: _selectedLanguage,
              items: <String>[
                'English',
                'Amharic',
              ].map((String value) {
                return DropdownMenuItem(
                  value: value.substring(0, 2).toLowerCase(),
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLanguage = newValue!;
                });
                if (_selectedLanguage == 'am') {
                  EasyLocalization.of(context)?.setLocale(Locale('am', 'ET'));
                } else {
                  EasyLocalization.of(context)?.setLocale(Locale('en', 'US'));
                }
              },
            ),
          ),
          // Positioned(
          //   top: 700,
          //   right: 20,
          //   child: GestureDetector(
          //     onTap: () {
          //       EasyLocalization.of(context)?.setLocale(Locale('am', 'ET'));
          //     },
          //     child: Text('Switch to Amharic'),
          //   ),
          // ),

          Positioned.fill(
            bottom: 100,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppLargeText(
                    text: "Welcome".tr(),
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
                  // GestureDetector(

                  SizedBox(
                    height: 20,
                  ),

                  ElevatedButton.icon(
                    onPressed: () async {
                      final provider = Provider.of<GoogleSign>(context, listen: false);
                      GoogleSignInAccount? user = await provider.googleSignIn.currentUser;
                      if (user == null) {
                        // User is not signed in, prompt them to sign in
                        await provider.googleLogin();
                      }
                      // Navigate to the email selection page immediately after signing in
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                      );
                    },
                    icon: FaIcon(FontAwesomeIcons.google, color: Colors.red,),
                    label: isclicked ==false? Text("continue with Google".tr()):CircularProgressIndicator(color: Colors.white,),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      fixedSize: MaterialStateProperty.all<Size>(Size(300, 50)),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}