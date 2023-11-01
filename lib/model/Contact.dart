import 'package:flutter/material.dart';

class Contact {
  String name;
  String phoneNum;
  String? group;
  String date;
  String birthDay;
 String  image;

  Contact({
    required this.name,
    required this.phoneNum,
    this.group,
    required this.date,
    required this.birthDay,
    required this.image,
  });
}
