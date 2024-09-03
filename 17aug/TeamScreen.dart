import 'package:flutter/material.dart';

class TeamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meet The Team"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'Developers',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          buildCarouselCard('Aryan', 'Flutter Developer'),
          buildCarouselCard('Darshaan', 'Backend Lead'),
          buildCarouselCard('Akshit', 'Developer'),
          buildCarouselCard('Amrit', 'Developer'),
          buildCarouselCard('Sampark', 'Developer'),
          buildCarouselCard('Krish', 'Developer'),
          SizedBox(height: 20),
          Text(
            'Designers',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          buildCarouselCard('Aditya', 'UI/UX Designer'),
          buildCarouselCard('Gourav', 'UI/UX Designer'),
          buildCarouselCard('Ishi', 'UI/UX Designer'),
        ],
      ),
    );
  }

  Widget buildCarouselCard(String name, String role) {
    return Card(
      color: Color(0xFF2A2A2A),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/avatar_placeholder.png'), // Replace with your asset
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 5),
                Text(
                  role,
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
