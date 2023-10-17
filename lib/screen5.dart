import 'package:flutter/material.dart';

class Screen5 extends StatefulWidget {
  const Screen5({super.key});

  @override
  State<Screen5> createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  List<String> options = ['option1', 'option2', 'option3'];

  @override
  Widget build(BuildContext context) {
    String _currentOption = options[0];

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "Please upload a Valid Id",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF202020)),
              ),
            ),
            SizedBox(
              height: 66,
            ),
            Container(
              height: 88,
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Issuing Country",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF202020)),
                  ),
                  Container(
                    height: 59,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFFEDEDED)),
                    child: ExpansionTile(
                      title: Text(
                        "Select your Country",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF17526D)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Document Type',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
            ),
            // ListTile(
            //   title: Text('Passport'),
            //   leading: Radio(
            //     value: options[0],
            //     groupValue: _currentOption,
            //     onChanged: (value) {},
            //   ),
            // ),
            // ListTile(
            //   title: Text('Aadhar Card'),
            //   leading: Radio(
            //     value: options[0],
            //     groupValue: _currentOption,
            //     onChanged: (value) {},
            //   ),
            // ),
            // ListTile(
            //   title: Text(
            //     'PAN Card',
            //     style: TextStyle(
            //         fontSize: 13,
            //         fontWeight: FontWeight.w400,
            //         color: Color(0xFF202020)),
            //   ),
            //   leading: Radio(
            //     value: options[0],
            //     groupValue: _currentOption,
            //     onChanged: (value) {},
            //   ),
            // ),
            Row(
              children: [
                Radio(
                  value: options[0],
                  groupValue: _currentOption,
                  onChanged: (value) {},
                ),
                Text(
                  'Passport',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF202020)),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  activeColor: null,
                  fillColor: null,
                  focusColor: Colors.white,
                  value: options[0],
                  groupValue: _currentOption,
                  onChanged: (value) {},
                ),
                Text(
                  'Aadhar Card',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF202020)),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: options[0],
                  groupValue: _currentOption,
                  onChanged: (value) {},
                ),
                Text(
                  'PAN Card',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF202020)),
                ),
              ],
            ),
            SizedBox(
              height: 33,
            ),
            Center(
              child: Container(
                height: 71,
                width: 180,
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
                          "Make sure it’s well lit.",
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
                          "Make sure the photo is sharp.",
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
                          "Try to minimize glair.",
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
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "Upload.jpg file",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF17526D),
                    decoration: TextDecoration.underline,
                    decorationThickness: 2),
              ),
            ),
            SizedBox(
              height: 26,
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
                  'Open the Camera',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xFFF7F7F7)),
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
