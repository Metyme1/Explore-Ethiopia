import 'package:flutter/material.dart';
import 'main_page.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            padding: EdgeInsets.only(top: 50),

          ),
           Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150',
                ),
              ),
              SizedBox(height: 20),
              Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),

            ],
          ),
          _buildSettingOption(
            context,
            icon: Icons.notifications,
            title: 'Notifications',
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
                    onTap: () {},
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