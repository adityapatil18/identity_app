import 'dart:io';

import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelfieScreen extends StatefulWidget {
  const SelfieScreen({Key? key}) : super(key: key);

  @override
  State<SelfieScreen> createState() => _SelfieScreenState();
}

class _SelfieScreenState extends State<SelfieScreen> {
  XFile? image;
  String imagePath = "";
  @override
  void initState() {
    super.initState();
    // imagePath=(SharedPreferencesFunctions().getSelfie()==null?"":SharedPreferencesFunctions().getSelfie())!;
    // print("imagePath$imagePath");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Step 5/9. Loading Of the Selfie",
            style: TextStyle(fontSize: 20, color: Colors.white)),
        SizedBox(
          height: 50,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 200,
          height: 250,
          decoration: BoxDecoration(),
          child: imagePath == "" || imagePath.isEmpty
              ? Image.asset("images/referalnew.png")
              : Image.file(
                  File(imagePath!),
                  fit: BoxFit.fill,
                ),
        ),
        SizedBox(
          height: 20,
        ),
        Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text("Please Upload a Selfie with Aadhaar Letter/Card",
                style: TextStyle(color: Colors.white))),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsetsDirectional.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.info_outline, color: Colors.amber),
              SizedBox(
                width: 20,
              ),
              Flexible(
                  child: Text(
                      "In the picture, the document must be on a flat surface with all 4 corners in the frame, and the information on it must be clearly visible and distinguishable.",
                      style: TextStyle(color: Colors.white70, fontSize: 12))),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextButton(
            onPressed: () {
              onPressed();
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.camera_alt, color: Colors.white, size: 25),
                SizedBox(
                  width: 20,
                ),
                Text("Take a Photo",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ],
            )),
        SizedBox(
          height: 10,
        ),
        TextButton(
            onPressed: () {
              getImage(ImageSource.gallery);
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 80,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
                color: Colors.transparent.withOpacity(0.5),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.upload, color: Colors.white, size: 25),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Upload a Photo",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
            )),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //  SizedBox(
            // width: 100,
            // child: AppButton(() {
            //   setState(() {
            //     value = "BackAdharcard";
            //   });
            //   Navigator.push(
            //       context, MaterialPageRoute(builder: (context) => DepositTabs(index: 1,)));
            // }, "Back")),
            // SizedBox(
            //     width: 100,
            //     child: AppButton(() {
            //       if(imagePath==""){
            //         showToast("Please Upload a Selfie with Aadhaar Letter/Card");
            //       }else {
            //         setState(() {
            //           value = "FrontPanCard";
            //         });
            //         Navigator.push(
            //             context, MaterialPageRoute(builder: (context) => DepositTabs(index: 1,)));
            //       }
            //     }, "Next")),
          ],
        ),
      ],
    );
  }

  Future getImage(ImageSource media) async {
    var img = await ImagePicker().pickImage(source: media);

    setState(() {
      image = img;
      imagePath = image!.path;
      // SharedPreferencesFunctions().saveSelfie(image!.path);
    });
  }

  void onPressed() async {
    List<String> pictures;
    try {
      pictures = await CunningDocumentScanner.getPictures() ?? [];
      if (!mounted) return;
      setState(() {
        //  print("pictures  $pictures");
        imagePath = pictures[0].toString();
        // SharedPreferencesFunctions().saveSelfie(imagePath);
        // print("imagePath===>$imagePath");
      });
    } catch (exception) {
      // Handle exception here
    }
  }
}
