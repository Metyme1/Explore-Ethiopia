import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'google_signin.dart';
import 'main_page.dart';

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
                filterQuality: FilterQuality.high,
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
                  // AppLargeText(
                  //   text: "Welcome to Ethiopia".tr(),
                  //   color: Colors.white,
                  // ),
                  // AppText(
                  //   text: "to Ethiopia",
                  //   size: 30,
                  //   color: Colors.white,
                  // ),
                  SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(

                      "Ethiopia is a country that offers a rich and diverse range of tourist attractions. From its ancient history and cultural heritage to its natural wonders and vibrant music scene, there is something for everyone in this fascinating country.".tr(),
                      style: TextStyle(

                        fontWeight: FontWeight.normal,  // make the text bold
                        color: Colors.white,
                        fontSize: 17,// set the text color to teal
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5,
                            offset: Offset(2, 2),
                          ),
                        ],  // add a shadow effect to the text
                      ),
                    ),

                  ),
                  // SizedBox(height: 40),
                  // // GestureDetector(
                  //
                  SizedBox(
                    height: 20,
                  ),

                  isclicked==false?    ElevatedButton.icon(
                    onPressed: () async {
                      setState(() {
                        isclicked=true;
                      });
                      final provider = Provider.of<GoogleSign>(context, listen: false);
                      GoogleSignInAccount? user = await provider.googleSignIn.currentUser;
                      if (user == null) {
                        // User is not signed in, prompt them to sign in
                        await provider.googleLogin();
                      }
                      // Navigate to the email selection page immediately after signing in
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
                      // Navigator.pushre(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => MainPage()),
                      // );
                    },
                    icon: FaIcon(FontAwesomeIcons.google, color: Colors.red,),
                    label: isclicked ==false? Text("Signin to Explore more  ".tr()):CircularProgressIndicator(color: Colors.white,),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      fixedSize: MaterialStateProperty.all<Size>(Size(300, 50)),
                    ),
                  ):CircularProgressIndicator(color: Colors.white,)

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}