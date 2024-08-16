// lib/models/task.dart

import 'package:flutter/material.dart';

class Task {
  final String id;
  final String title;
  final DateTime dueDate;
  final TimeOfDay dueTime;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.dueDate,
    required this.dueTime,
    this.isCompleted = false,
  });
}
