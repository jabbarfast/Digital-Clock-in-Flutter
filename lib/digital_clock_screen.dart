import 'dart:async';
import 'package:flutter/material.dart';

class DigitalClockScreen extends StatefulWidget {
  const DigitalClockScreen({super.key});

  @override
  State<DigitalClockScreen> createState() => _DigitalClockScreenState();
}

class _DigitalClockScreenState extends State<DigitalClockScreen> {
  String timeString = '';
  late Timer timer;

  // Current colors
  Color clockColor = Colors.white;
  Color backgroundColor = Colors.blue.shade800;

  final Map<String, Color> colorOptions = {
    'White': Colors.white,
    'Red': Colors.red,
    'Blue': Colors.blue,
    'Green': Colors.green,
    'Yellow': Colors.yellow,
    'Purple': Colors.purple,
    'Black': Colors.black,
  };

  @override
  void initState() {
    super.initState();
    updateTime();
    timer =
        Timer.periodic(const Duration(seconds: 1), (Timer t) => updateTime());
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void updateTime() {
    final DateTime now = DateTime.now();
    final String formattedTime =
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';
    setState(() {
      timeString = formattedTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              timeString,
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: clockColor,
                fontFamily: 'Courier',
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Clock Color Dropdown
                Column(
                  children: [
                    const Text(
                      "Clock Color",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    DropdownButton<String>(
                      value: colorOptions.keys.firstWhere(
                        (key) => colorOptions[key] == clockColor,
                        orElse: () => 'White',
                      ),
                      items: colorOptions.entries.map((entry) {
                        return DropdownMenuItem<String>(
                          value: entry.key,
                          child: Text(entry.key,
                              style: TextStyle(color: entry.value)),
                        );
                      }).toList(),
                      onChanged: (String? newColor) {
                        if (newColor != null) {
                          setState(() {
                            clockColor = colorOptions[newColor]!;
                          });
                        }
                      },
                      dropdownColor: Colors.black,
                      iconEnabledColor: Colors.white,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(width: 30),
                // Background Color Dropdown
                Column(
                  children: [
                    const Text(
                      "Background Color",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    DropdownButton<String>(
                      value: colorOptions.keys.firstWhere(
                        (key) => colorOptions[key] == backgroundColor,
                        orElse: () => 'Blue',
                      ),
                      items: colorOptions.entries.map((entry) {
                        return DropdownMenuItem<String>(
                          value: entry.key,
                          child: Text(entry.key,
                              style: TextStyle(color: entry.value)),
                        );
                      }).toList(),
                      onChanged: (String? newColor) {
                        if (newColor != null) {
                          setState(() {
                            backgroundColor = colorOptions[newColor]!;
                          });
                        }
                      },
                      dropdownColor: Colors.black,
                      iconEnabledColor: Colors.white,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
