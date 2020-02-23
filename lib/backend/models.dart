import 'package:flutter/material.dart';

class User {
  final String name;
  final String description;
  final String imagePath;
  final DateTime birthday;

  const User({
    @required this.name,
    this.description,
    this.imagePath,
    this.birthday,
  });

calculateAge() {
  DateTime birthDate = this.birthday;
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - birthDate.year;
  int month1 = currentDate.month;
  int month2 = birthDate.month;
  if (month2 > month1) {
    age--;
  } else if (month1 == month2) {
    int day1 = currentDate.day;
    int day2 = birthDate.day;
    if (day2 > day1) {
      age--;
    }
  }
  return age;
}
}