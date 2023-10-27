// // This screen is for uploading photo of document

// import 'dart:io';

// import 'package:cunning_document_scanner/cunning_document_scanner.dart';
// import 'package:flutter/material.dart';
// import 'package:identity_app/loader_screen.dart';
// import 'package:identity_app/sharedPreferences.dart';
// import 'package:image_picker/image_picker.dart';

// class Screen6 extends StatefulWidget {
//   const Screen6({super.key});

//   @override
//   State<Screen6> createState() => _Screen6State();
// }

// class _Screen6State extends State<Screen6> {
//   String capturedDocument = ''; // to hold captured image path

//   @override
//   void initState() {
//     print(SharedPreferencesFunctions().getSelfie);

//     super.initState();
//     capturedDocument = SharedPreferencesFunctions().getSelfie() == null ||
//             SharedPreferencesFunctions().getSelfie() == 'null'
//         ? ""
//         : SharedPreferencesFunctions().getSelfie()!;
//     print("imagePath$capturedDocument");
//   }

//   Future<void> scanDocument() async {
//     try {
//       final List<String>? document = await CunningDocumentScanner.getPictures();
//       if (document != null && document.isNotEmpty) {
//         final String imagePath = document[0];
//         setState(() {
//           capturedDocument = imagePath;
//         });
//         // saveCapturedImage(
//         //     imagePath);
//         //
//         // Save the captured image path in SharedPreferences
//         SharedPreferencesFunctions().saveSelfie(imagePath.toString());
//       }
//     } catch (e) {
//       print("Error scanning document: $e");
//     }
//   }

//   Future<void> pickImage() async {
//     final ImagePicker _picker = ImagePicker();
//     final XFile? pickedImage =
//         await _picker.pickImage(source: ImageSource.gallery);

//     if (pickedImage != null) {
//       SharedPreferencesFunctions().saveSelfie(pickedImage.path);
//       setState(() {
//         capturedDocument = pickedImage.path;
//       });
//     }
//     SharedPreferencesFunctions().saveSelfie(pickedImage.toString());
//   }

//   // // Save the captured image path to SharedPreferences.
//   // Future<void> saveCapturedImage(String imagePath) async {
//   //   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   await prefs.setString('capturedImage', imagePath);
//   // }

//   // Future<void> scanDocument() async {
//   //   try {
//   //     final List<String>? document = await CunningDocumentScanner.getPictures();
//   //     if (document != null && document.isNotEmpty) {
//   //       final String imagePath = document[0];
//   //       setState(() {
//   //         capturedDocument = imagePath;
//   //       });
//   //       saveCapturedImage(
//   //           imagePath); // Save the captured image path in SharedPreferences
//   //     }
//   //   } catch (e) {
//   //     print("Error scanning document: $e");
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back_ios,
//             size: 24,
//           ),
//           color: Colors.black,
//         ),
//         title: Text(
//           "Verify your Identity",
//           style: TextStyle(
//               fontSize: 25,
//               fontWeight: FontWeight.w700,
//               color: Colors.black.withOpacity(0.7)),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 100,
//             ),
//             Center(
//               child: Stack(
//                 children: [
//                   Container(
//                     height: 240,
//                     width: 240,
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                             image: AssetImage('images/Vector.png'))),
//                   ),
//                   Positioned(
//                     top: 50,
//                     left: 50,
//                     child: Container(
//                       height: 140,
//                       width: 140,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         image: DecorationImage(
//                             image: capturedDocument != ""
//                                 ? FileImage(File(
//                                     capturedDocument!)) // Use the captured image
//                                 : AssetImage('images/card.png')
//                                     as ImageProvider,
//                             fit: BoxFit.cover // Use default image
//                             ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 178,
//             ),
//             GestureDetector(
//               child: Text(
//                 capturedDocument == '' ? 'Upload.jpg file' : 'Retake photo',
//                 style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400,
//                     color: Color(0xFF17526D),
//                     decoration: TextDecoration.underline,
//                     decorationThickness: 2),
//               ),
//               onTap: () {
//                 if (capturedDocument == '') {
//                   pickImage();
//                 }
//               },
//             ),
//             SizedBox(
//               height: 26,
//             ),
//             GestureDetector(
//               child: Container(
//                 alignment: Alignment.center,
//                 height: 47,
//                 width: MediaQuery.sizeOf(context).width,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Color.fromARGB(255, 23, 82, 109),
//                 ),
//                 child: Text(
//                   capturedDocument == '' ? "Open Camera" : "Submit for review",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 16,
//                       color: Color(0xFFF7F7F7)),
//                 ),
//               ),
//               onTap: () {
//                 if (capturedDocument == "") {
//                   scanDocument();
//                 } else {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => Screen3(),
//                       ));
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/material.dart';
import 'package:identity_app/loader_screen.dart';
import 'package:identity_app/main.dart';
import 'package:identity_app/sharedPreferences.dart';
import 'package:image_picker/image_picker.dart';

class Screen6 extends StatefulWidget {
  const Screen6({super.key});

  @override
  State<Screen6> createState() => _Screen6State();
}

class _Screen6State extends State<Screen6> {
  String capturedDocument = ''; // to hold captured image path

  @override
  void initState() {
    super.initState();
    capturedDocument = SharedPreferencesFunctions().getSelfie() == null ||
            SharedPreferencesFunctions().getSelfie() == 'null'
        ? ""
        : SharedPreferencesFunctions().getSelfie()!;
  }

  Future<void> scanDocument() async {
    try {
      final List<String>? document = await CunningDocumentScanner.getPictures();
      if (document != null && document.isNotEmpty) {
        final String imagePath = document[0];
        setState(() {
          capturedDocument = imagePath;
        });
        SharedPreferencesFunctions().saveSelfie(imagePath.toString());
      }
    } catch (e) {
      print("Error scanning document: $e");
    }
  }

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        capturedDocument = pickedImage.path;
      });
      SharedPreferencesFunctions().saveSelfie(pickedImage.path);
    }
  }

  Future<void> uploadDocumentToApi(String userId) async {
    if (capturedDocument.isNotEmpty) {
      try {
        String apiUrl =
            'http://apifirst.idleplay.in/api/auth/update-kyc-photoId/$userId';
        Map<String, String> headers = {
          'Content-Type': 'application/json',
          'appversion': version, // Replace with the actual app version
          'devicetype': 'android',
          'userid': userId,
        };

        // Read the image file as bytes
        final File imageFile = File(capturedDocument);
        List<int> imageBytes = await imageFile.readAsBytes();

        // Convert the image bytes to base64
        String base64Image = base64Encode(imageBytes);

        Map<String, dynamic> requestBody = {
          "propertyName": "Adhar Card",
          'image': base64Image,
          "state": "Maharashtra"
        };

        final response = await http.post(
          Uri.parse(apiUrl),
          headers: headers,
          body: jsonEncode(requestBody),
        );

        if (response.statusCode == 200) {
          print('API response: ${response.body}');
          // Handle the API response as needed
        } else {
          print('Error while uploading image: ${response.statusCode}');
          print(response.body);
          // Handle the error response
        }
      } catch (e) {
        print('Error uploading image: $e');
      }
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
            size: 24,
          ),
          color: Colors.black,
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
              height: 100,
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
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: capturedDocument.isNotEmpty
                              ? FileImage(File(capturedDocument))
                              : AssetImage('images/card.png') as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 178,
            ),
            GestureDetector(
              child: Text(
                capturedDocument.isEmpty ? 'Upload.jpg file' : 'Retake photo',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF17526D),
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                ),
              ),
              onTap: () {
                if (capturedDocument.isEmpty) {
                  pickImage();
                }
              },
            ),
            SizedBox(
              height: 26,
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
                  capturedDocument.isEmpty
                      ? "Open Camera"
                      : "Submit for review",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xFFF7F7F7),
                  ),
                ),
              ),
              onTap: () {
                if (capturedDocument.isEmpty) {
                  scanDocument();
                } else {
                  uploadDocumentToApi(
                      '653a6e8cae6fa30e5bb1b2f0'); // Replace with the actual user ID
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
