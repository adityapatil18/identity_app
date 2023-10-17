import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  Future<void> scanDocument() async {
    try {
      final List<String>? document = await CunningDocumentScanner.getPictures();
     print('clicked');
    } catch (e) {
      print("Error scanning document: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          size: 24,
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
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
              child: Container(
                alignment: Alignment.center,
                height: 240,
                width: 240,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/face-id.png'))),
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
                  'Open Camera',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xFFF7F7F7)),
                ),
              ),
              onTap: () {
                scanDocument();
              },
            ),
          ],
        ),
      ),
    );
  }
}
