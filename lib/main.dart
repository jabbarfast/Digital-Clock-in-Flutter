import 'package:flutter/material.dart';
import 'package:digital_clock/digital_clock_screen.dart';

void main() => runApp(const DigitalClockApp());

class DigitalClockApp extends StatelessWidget {
  const DigitalClockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digital Clock',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const DigitalClockScreen(),
    );
  }
}
