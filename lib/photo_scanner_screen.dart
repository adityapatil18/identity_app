// This screen is used for uploading selfie



import 'dart:io';

import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/material.dart';
import 'package:identity_app/loader_screen.dart';
import 'package:identity_app/sharedPreferences.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  String capturedImage = ''; // to hold captured image path

  

  @override
  void initState() {
    print(SharedPreferencesFunctions().getSelfie);

    super.initState();
    capturedImage = SharedPreferencesFunctions().getSelfie() == null ||
            SharedPreferencesFunctions().getSelfie() == 'null'
        ? ""
        : SharedPreferencesFunctions().getSelfie()!;
    print("imagePath$capturedImage");
  }

// Load the captured image path from SharedPreferences.
  // Future<void> loadCapturedImage() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String? savedImage = prefs.getString('capturedImage');
  //   if (savedImage != null) {
  //     setState(() {
  //       capturedImage = savedImage;
  //     });
  //   }
  // }

  // Save the captured image path to SharedPreferences.
  // Future<void> saveCapturedImage(String imagePath) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('capturedImage', imagePath);
  // }

  Future<void> scanDocument() async {
    try {
      final List<String>? document = await CunningDocumentScanner.getPictures();
      if (document != null && document.isNotEmpty) {
        final String imagePath = document[0];
        setState(() {
          capturedImage = imagePath;
        });
        // saveCapturedImage(
        //     imagePath);
        //
        // Save the captured image path in SharedPreferences
        SharedPreferencesFunctions().saveSelfie(imagePath.toString());
      }
    } catch (e) {
      print("Error scanning document: $e");
    }
  }

  // Future<void> scanDocument() async {
  //   try {
  //     final List<String>? document = await CunningDocumentScanner.getPictures();
  //     if (document != null && document.isNotEmpty) {
  //       setState(() {
  //         capturedImage = document[0];
  //       });
  //     }
  //   } catch (e) {
  //     print("Error scanning document: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(
        //   size: 24,
        //   Icons.arrow_back_ios,
        //   color: Colors.black,
        // ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 24,
            )),
        title: Text(
          "Verify your Identity",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Colors.black.withOpacity(0.7)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 101,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    height: 240,
                    width: 240,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/Vector.png'))),
                  ),
                  Positioned(
                    top: 50,
                    left: 50,
                    child: Container(
                      height: 140,
                      width: 140,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: capturedImage != ''
                                ? FileImage(File(
                                    capturedImage!)) // Use the captured image
                                : AssetImage('images/user.png')
                                    as ImageProvider,
                            fit: BoxFit.cover // Use default image
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Container(
              height: 87,
              width: 332,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Important Notes:',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF202020)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        child: Icon(
                          Icons.check,
                          color: Color(0xFF202020).withOpacity(0.4),
                          size: 15,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Capture a front-facing selfie in portrait mode.',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xFF202020).withOpacity(0.4)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        child: Icon(
                          Icons.check,
                          color: Color(0xFF202020).withOpacity(0.4),
                          size: 15,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Ensure you are well-lit.',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xFF202020).withOpacity(0.4)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        child: Icon(
                          Icons.check,
                          color: Color(0xFF202020).withOpacity(0.4),
                          size: 15,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Clearly show your face in the photo.',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xFF202020).withOpacity(0.4)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        child: Icon(
                          Icons.check,
                          color: Color(0xFF202020).withOpacity(0.4),
                          size: 15,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Keep your phone in a vertical position for the best results.',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xFF202020).withOpacity(0.4)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 94,
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
                  capturedImage == '' ? "Open Camera" : "Submit for review",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xFFF7F7F7)),
                ),
              ),
              onTap: () {
                if (capturedImage == '') {
                  scanDocument();
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Screen3(),
                      ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
