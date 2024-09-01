import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MeetTheTeamPage(),
    );
  }
}

class MeetTheTeamPage extends StatelessWidget {
  final List<String> developerNames = ['Aryan', 'Dharrsan', 'Akshit', 'Amrit', 'Sampark', 'Krish'];
  final List<String> designerNames = ['Aditya', 'Gourav', 'Ishi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Implement the back button action here
          },
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MEET THE TEAM',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'DEVELOPERS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            buildCarousel(developerNames, 'Developer'),
            SizedBox(height: 20),
            Text(
              'DESIGNERS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            buildCarousel(designerNames, 'UI/UX Designer'),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/ieee_logo.png', width: 80, height: 80),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCarousel(List<String> names, String role) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: names.length,
        itemBuilder: (context, index) {
          return buildTeamCard(names[index], role);
        },
      ),
    );
  }

  Widget buildTeamCard(String name, String role) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/avatar.png'), // Placeholder for avatar image
            ),
            SizedBox(height: 10),
            Text(
              name.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
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
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.linked_camera, color: Colors.white, size: 20),
                SizedBox(width: 5),
                Icon(Icons.code, color: Colors.white, size: 20),
                SizedBox(width: 5),
                Icon(Icons.design_services, color: Colors.white, size: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

