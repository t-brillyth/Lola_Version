import 'package:flutter/material.dart';

class SelectAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Esta es la nueva página',
          style: TextStyle(color: Colors.red), // 'Color' debe ser 'color'
        ),
      ),
    );
  }
}
