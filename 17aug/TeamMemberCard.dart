import 'package:flutter/material.dart';
import '../models/team_member.dart';

class TeamMemberCard extends StatelessWidget {
  final TeamMember member;

  TeamMemberCard({required this.member});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black54,
      shape: RoundedRectangle
