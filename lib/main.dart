import 'package:flutter/material.dart';
import 'package:flutter_application_lotto/awards.dart';
import 'package:flutter_application_lotto/login.dart';
import 'package:flutter_application_lotto/profile.dart';
import 'package:flutter_application_lotto/purchase.dart';
import 'package:flutter_application_lotto/reward.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      home: ProfileScreen(),
    );
  }
}