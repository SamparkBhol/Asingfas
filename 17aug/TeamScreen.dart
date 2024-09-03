import 'package:flutter/material.dart';

class TeamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191919),
      appBar: AppBar(
        backgroundColor: Color(0xFF191919),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('MEET THE TEAM', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DEVELOPERS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  buildTeamCard('Darshaan', 'Backend Lead', 'assets/images/darshaan.png'),
                  buildTeamCard('Aryan', 'Flutter Developer', 'assets/images/aryan.png'),
                  buildTeamCard('Akshit', 'Flutter Developer', 'assets/images/akshit.png'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'DESIGNERS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  buildTeamCard('Æsh', 'UI/UX Designer', 'assets/images/aesh.png'),
                  buildTeamCard('K Gaurav', 'UI/UX Designer', 'assets/images/gaurav.png'),
                  buildTeamCard('Ishi', 'UI/UX Designer', 'assets/images/ishi.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTeamCard(String name, String role, String imagePath) {
    return Card(
      color: Color(0xFF232323),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imagePath),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  role,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Icon(Icons.linked_in, color: Colors.white70, size: 20),  // Replace with actual icon or image for LinkedIn
                SizedBox(width: 8),
                Icon(Icons.inbox, color: Colors.white70, size: 20),       // Replace with actual icon or image for Instagram
                SizedBox(width: 8),
                Icon(Icons.wifi, color: Colors.white70, size: 20),        // Replace with actual icon or image for GitHub
              ],
            ),
          ],
        ),
      ),
    );
  }
}
