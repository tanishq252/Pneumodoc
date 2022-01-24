import 'dart:async';
// import 'dart:html';
import 'dart:io';
import 'package:flutter_svg/svg.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var h, w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return
        // Stack(
        //   children: [
        ListView(
      children: [
        Container(
          height: h,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                Colors.black,
                Color(0xff87CDFF),
              ])),
          child: Stack(
            children: [
              Positioned(
                top: h / 9,
                child: Container(
                    width: w,
                    child: Image.asset(
                      "assets/doc.png",
                      width: w,
                    )),
              ),
              Container(
                width: w,
                child: SvgPicture.asset(
                  "assets/head.svg",
                  width: w,
                ),
              ),
              Positioned(
                  top: h / 2.7,
                  left: (w - (w / 1.3)) * 0.5,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    padding: EdgeInsets.all(17),
                    height: h / 2.3,
                    width: w / 1.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff87CDFF)),
                    child: Column(
                      children: [
                        Container(
                          height: 47,
                        ),
                        Text(
                          "Welcome To PneumoDoc!",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          height: 17,
                        ),Text(
                          "This app is having functionality to predict whether the patient is having pneumonia or not.",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          height: 17,
                        ),Text(
                          "You will need to go to the predictor page below and you will be having two functionalities including camera and gallery.",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          height: 17,
                        ),Text(
                          "You can either take a photo of you x-ray or you can upload the image from your device storage or drive and check the results",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  )),
              Positioned(
                  top: h / 5,
                  height: h / 4,
                  left: (w - (w / 1.3)) * 0.5,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    height: h / 2,
                    width: w / 1.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff264B88)),
                    child: Column(
                      children: [
                        Container(
                          height: 17,
                        ),
                        Image.asset(
                          "assets/b.png",
                          width: w / 6,
                        ),
                        Container(
                          height: 17,
                        ),
                        Text(
                          "AI based app to \n detect pneumonia",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
