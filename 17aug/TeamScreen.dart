import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/team_member.dart';
import '../widgets/team_member_card.dart';

class TeamScreen extends StatelessWidget {
  final List<TeamMember> developers = [
    TeamMember(name: 'Aryan', linkedInUrl: 'https://linkedin.com/', githubUrl: 'https://github.com/'),
    TeamMember(name: 'Dharrsan', linkedInUrl: 'https://linkedin.com/', githubUrl: 'https://github.com/'),
    TeamMember(name: 'Akshit', linkedInUrl: 'https://linkedin.com/', githubUrl: 'https://github.com/'),
    TeamMember(name: 'Amrit', linkedInUrl: 'https://linkedin.com/', githubUrl: 'https://github.com/'),
    TeamMember(name: 'Sampark', linkedInUrl: 'https://linkedin.com/', githubUrl: 'https://github.com/'),
    TeamMember(name: 'Krish', linkedInUrl: 'https://linkedin.com/', githubUrl: 'https://github.com/'),
  ];

  final List<TeamMember> designers = [
    TeamMember(name: 'Aditya', linkedInUrl: 'https://linkedin.com/', githubUrl: 'https://github.com/'),
    TeamMember(name: 'Gourav', linkedInUrl: 'https://linkedin.com/', githubUrl: 'https://github.com/'),
    TeamMember(name: 'Ishi', linkedInUrl: 'https://linkedin.com/', githubUrl: 'https://github.com/'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Team'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Developers',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            CarouselSlider(
              options: CarouselOptions(
                height: 250.0,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
              ),
              items: developers.map((member) {
                return TeamMemberCard(member: member);
              }).toList(),
            ),
            SizedBox(height: 30),
            Text(
              'Designers',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            CarouselSlider(
              options: CarouselOptions(
                height: 250.0,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
              ),
              items: designers.map((member) {
                return TeamMemberCard(member: member);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
