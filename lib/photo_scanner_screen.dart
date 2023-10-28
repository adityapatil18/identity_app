

import 'dart:convert';
import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/material.dart';
import 'package:identity_app/loader_screen.dart';
import 'package:identity_app/main.dart';
import 'package:identity_app/sharedPreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  String capturedImage = ''; // to hold captured image path

  @override
  void initState() {
    super.initState();
    loadCapturedImage();
  }

  Future<void> loadCapturedImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      capturedImage = prefs.getString('capturedImage') ?? '';
    });
  }

  Future<void> scanDocument() async {
    try {
      final List<String>? document = await CunningDocumentScanner.getPictures();
      if (document != null && document.isNotEmpty) {
        final String imagePath = document[0];
        setState(() {
          capturedImage = imagePath;
        });
        SharedPreferencesFunctions().saveSelfie(imagePath);
      }
    } catch (e) {
      print("Error scanning document: $e");
    }
  }

  Future<void> uploadImageToApi(String userId) async {
    try {
      if (capturedImage.isNotEmpty) {
        File imageFile = File(capturedImage);

        // Compress the image before uploading
        final compressedImageBytes =
            await FlutterImageCompress.compressWithFile(imageFile.path,
                minHeight: 10, minWidth: 10, quality: 10);
        print(compressedImageBytes);

        String base64Image = base64Encode(compressedImageBytes!);

        String apiUrl =
            'http://apifirst.idleplay.in/api/auth/update-kyc-profile/$userId';

        Map<String, String> headers = {
          'Content-Type': 'application/json',
          'appversion': version, // Replace with the actual app version
          'devicetype': 'android',
          'userid': userId,
        };

        Map<String, dynamic> requestBody = {
          'image': base64Image,
          'userId': userId,
        };

        final response = await http.post(
          Uri.parse(apiUrl),
          headers: headers,
          body: jsonEncode(requestBody),
        );

        if (response.statusCode == 200) {
          print('API response: ${response.body}');
        } else {
          print('Error updating KYC profile: ${response.statusCode}');
          print(response.body);
        }
      } else {
        print('No image to upload.');
      }
    } catch (e) {
      print('Error updating KYC profile image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 24,
          ),
        ),
        title: Text(
          "Verify your Identity",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: Colors.black.withOpacity(0.7),
          ),
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
                        image: AssetImage('images/Vector.png'),
                      ),
                    ),
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
                              ? FileImage(File(capturedImage))
                              : AssetImage('images/user.png') as ImageProvider,
                          fit: BoxFit.cover,
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
                  // Important Notes section
                  // ... Your important notes content here ...
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
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 23, 82, 109),
                ),
                child: Text(
                  capturedImage == '' ? "Open Camera" : "Submit for review",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xFFF7F7F7),
                  ),
                ),
              ),
              onTap: () {
                if (capturedImage == '') {
                  scanDocument();
                } else {
                  uploadImageToApi(
                      '653a6e8cae6fa30e5bb1b2f0'); // Call the function to upload the image
                  // You can also navigate to the next screen here if needed
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => Screen3(),
                  //   ),
                  // );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
