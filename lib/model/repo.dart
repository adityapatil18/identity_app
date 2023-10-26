import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:identity_app/main.dart';
import 'package:identity_app/photo_scanner_screen.dart';
import 'package:identity_app/sharedPreferences.dart';

class Repository {
  var ResetStatus;
  var otpStatus = "3";
  var status = false;
  var statusCode = 200;
  var errorMessage = "Something went wrong";
  var statusMessage = "";
  var body;
  Map<String, String> header = {
    HttpHeaders.contentTypeHeader: "application/json"
  };

  getKycProfilePhoto({String userid = "", String selectImage = "", context}) async {
    print("selectImage==============$selectImage");

    Uri uri = Uri.parse("${base64Url}api/auth/update-kyc-profile/:userId=$userid");
    var response = await http.post(uri,
        headers: {
          'appversion': version,
          'devicetype': 'android',
          'Content-Type': 'application/json',
          'userid': SharedPreferencesFunctions().getLoginUserId()!,
        },
        body: json.encode({
          "userId": userid,
          "image": selectImage,
        }));

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('kyc profile photo updated sucessfully')));
      // showToast("Kyc Profile Updated Successfully");
    } else if (response.statusCode == 403) {
      SharedPreferencesFunctions().logout();
      // GoogleSignIn googleSignIn = GoogleSignIn();
      // await googleSignIn.signOut();
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => Screen2()));
    } else {
      print(jsonDecode(response.body));
    }
  }
}
