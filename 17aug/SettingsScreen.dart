import 'package:flutter/material.dart';
import 'team_screen.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF191919), Color(0xFF232323), Color(0xFF544F4F)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0.5, 0.85, 1],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile_pic.png'),
              ),
              SizedBox(height: 10),
              Text(
                'ÆSH',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              buildSettingsOption(context, 'Notifications', Icons.notifications),
              buildSettingsOption(context, 'Account', Icons.account_circle),
              buildSettingsOption(context, 'Help', Icons.help_outline),
              buildSettingsOption(context, 'About', Icons.info_outline),
              buildSettingsOption(context, 'The Team', Icons.group, onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => TeamScreen(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.ease;
                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);
                      return SlideTransition(position: offsetAnimation, child: child);
                    },
                  ),
                );
              }),
              buildSettingsOption(context, 'Logout', Icons.logout),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSettingsOption(BuildContext context, String title, IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: 20),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
          ],
        ),
      ),
    );
  }
}
