import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'google_signin.dart';
import 'main_page.dart';

class MyPage extends StatelessWidget {
  final user=FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
      Container(
         height: 100,

         decoration: BoxDecoration(
           color: Colors.teal,
           borderRadius: BorderRadius.only(
             bottomLeft: Radius.circular(0),
             bottomRight: Radius.circular(0),
           ),
         ),
         padding: EdgeInsets.only(top: 50),

       ),


          SizedBox(height: 100),
           Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  user.photoURL!
                ),
              ),
              SizedBox(height: 0),
              Text(
                'Name:'+ user.displayName!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Email:'+user.email!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              )
            ],
          ),

          Expanded(

            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildSettingOption(
                    context,
                    icon: Icons.security,
                    title: 'Security',
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isDismissible: true,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return Align(
                            alignment: Alignment.centerRight,
                            child: FractionallySizedBox(
                              widthFactor: 0.8,
                              child: TermandCondition(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Divider(),
                  _buildSettingOption(
                    context,
                    icon: Icons.notification_add,

                    title: 'notification',
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isDismissible: true,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return Align(
                            alignment: Alignment.centerRight,
                            child: FractionallySizedBox(
                              widthFactor: 0.8,
                              child: NotificationsBottomSheet(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Divider(),
                  _buildSettingOption(
                    context,
                    icon: Icons.info,
                    title: 'About',
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isDismissible: true,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return Align(
                            alignment: Alignment.centerRight,
                            child: FractionallySizedBox(
                              widthFactor: 0.8,
                              child: About(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Divider(),
                  _buildSettingOption(
                    context,
                    icon: Icons.logout,
                    title: 'Logout',
                    onTap: () {
                      final provider =
                          Provider.of<GoogleSign>(context, listen: false);
                      provider.logout();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingOption(BuildContext context,
      {required IconData icon,
        required String title,
        required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(icon, color: Colors.black),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class NotificationsBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.white,
      child: Center(
        child: Text('Notifications'),
      ),
    );
  }
}

class TermandCondition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.white,
      child: Center(
        child: Text('Security'),
      ),
    );
  }
}

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.white,
      child: Center(
        child: Text('About'),
      ),
    );
  }
}

