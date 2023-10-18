
// This screen is of loader 

import 'package:flutter/material.dart';
import 'package:identity_app/first_screen.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 128,
            ),
            Center(
              child: Container(
                height: 240,
                width: 240,
                child: Image.asset('images/loader.png'),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              "We're on it!",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF202020)),
            ),
            SizedBox(
              height: 66,
            ),
            Container(
              height: 48,
              width: 190,
              child: Text(
                "  Please check your email for      \nupdates on your account status. \n   This can take up to 48h.",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF202020)),
              ),
            ),
            SizedBox(
              height: 96,
            ),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                height: 47,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 23, 82, 109),
                ),
                child: Text(
                  'Done',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xFFF7F7F7)),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen1(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
