
//  This first screen from where application is started  


import 'package:flutter/material.dart';
import 'package:identity_app/screen2.dart';
import 'package:identity_app/screen5.dart';
import 'package:identity_app/sharedPreferences.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
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
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  height: 32,
                  width: 293,
                  alignment: Alignment.center,
                  child: Text(
                    "   Quickly verify your identity with our user-\nfriendly KYC process for a smoother experience.",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF202020).withOpacity(0.6)),
                  ),
                ),
              ),
              SizedBox(
                height: 116,
              ),
              Container(
                  height: 160,
                  width: MediaQuery.sizeOf(context).width,
                  child: Container(
                    height: 35,
                    width: MediaQuery.sizeOf(context).width,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: ListTile(
                              leading: CircleAvatar(
                                radius: 14,
                                backgroundColor: Color(0xFFEDEDED),
                                child: Image.asset(
                                  'images/happiness.png',
                                  height: 14,
                                  width: 14,
                                ),
                              ),
                              title: Text(
                                "Take a Selfie",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF17526D)),
                              ),
                              subtitle: Text(
                                "Verify your Identity with a quick selfie.",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF202020).withOpacity(0.6)),
                              ),
                              trailing:
                                  SharedPreferencesFunctions().getSelfie == null
                                      ? CircleAvatar(
                                          backgroundColor: Color(
                                            0xFFE5DEFF,
                                          ),
                                          radius: 16,
                                          child: Image.asset(
                                            'images/forward.png',
                                            height: 16,
                                            width: 16,
                                          ),
                                        )
                                      : Image.asset(
                                          'images/check.png',
                                          height: 24,
                                          width: 24,
                                        )),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Screen2(),
                                ));
                          },
                        ),
                        Divider(
                          thickness: 0.1,
                          color: Color(0xFF202020),
                        ),
                        GestureDetector(
                          child: ListTile(
                              leading: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Color(0xFFEDEDED),
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xFFEDEDED),
                                    radius: 14,
                                    child: Image.asset(
                                      'images/membership.png',
                                      height: 14,
                                      width: 14,
                                    ),
                                  )),
                              title: Text(
                                "Add a photo ID",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF17526D)),
                              ),
                              subtitle: Text(
                                "Secure your account by upploading a Photo ID.",
                                style: TextStyle(
                                    // letterSpacing: 0.7,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF202020).withOpacity(0.6)),
                              ),
                              trailing:
                                  SharedPreferencesFunctions().getSelfie == null
                                      ? CircleAvatar(
                                          backgroundColor: Color(
                                            0xFFE5DEFF,
                                          ),
                                          radius: 16,
                                          child: Image.asset(
                                            'images/forward.png',
                                            height: 16,
                                            width: 16,
                                          ),
                                        )
                                      : Image.asset(
                                          'images/check.png',
                                          height: 24,
                                          width: 24,
                                        )),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Screen5(),
                                ));
                          },
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 192,
              ),
              Container(
                alignment: Alignment.center,
                height: 47,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF17526D)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Continue Later',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xFF17526D)),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  height: 47,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromRGBO(23, 82, 109, 1.0).withOpacity(0.6),
                  ),
                  child: Text(
                    'Submit for review',
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
      ),
    );
  }
}
