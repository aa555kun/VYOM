import 'package:flutter/material.dart';
import 'package:vyom/page1.dart';

void main() {
  runApp(const VyomApp());
}

class VyomApp extends StatelessWidget {
  const VyomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VYOM',
      home: const WelcomePage(),
    );
  }
}
