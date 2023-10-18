import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Color color;

  CustomAppBar({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(56.0), // Adjust the height as needed
      child: AppBar(
        leading: Icon(Icons.arrow_back_ios, color: color),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
      ),
    );
  }
}
