import 'package:flutter/material.dart';
import 'custom_switch.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lola Components',
      theme: ThemeData(
        primaryColor: Colors.purple,
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 101, 101, 101)),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: CustomSwitch(),
    );
  }
}
