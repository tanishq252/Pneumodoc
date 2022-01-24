import 'dart:async';
// import 'dart:html';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import 'home.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  bool isvalid = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            HomePage(),
            MyHomePage(),
          ],
        ),
        bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(
            color:  Color(0xff4EADF2),
          ),
          child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 10.0),
            indicator: UnderlineTabIndicator(),
            indicatorColor: Colors.black54,
            tabs: <Widget>[
              
              Tab(
                icon: Icon(
                  Icons.home,
                  size: 28.0,
                ),
                text: 'Home',
              ),Tab(
                icon: Icon(
                  Icons.perm_device_information,
                  size: 24.0,
                ),
                text: 'Predictor',
              ),
            ],
          ),
        ),
      ),
    );
  }
}