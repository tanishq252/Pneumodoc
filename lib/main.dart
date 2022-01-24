// import 'dart:html';
import 'dart:async';
// import 'dart:html';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter/services.dart';

import 'bottomnab.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Tflite Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.lightGreenAccent,
        primaryColor: Colors.greenAccent,
      ),
      home: BottomNavBar(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _load = true;
  bool _gallery = true;
  late List _output;
  String output = "";

  late File _imgToPredict;
  final _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {
        late List _output = [""];
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     backgroundColor: Colors.deepPurpleAccent,
      //     title: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Container(
      //           child: Text(
      //             "Pneumonia Detector",
      //             style: TextStyle(
      //               color: Colors.black54,
      //               fontSize: 18,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         )
      //       ],
      //     )),
      body: ListView(
        children: [
          Container(
            height: 877,
            padding: EdgeInsets.fromLTRB(35, 27, 35, 120),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.black,
                  Color(0xff4EADF2),
                ])),
            child: Container(
              height: 830,
              decoration: BoxDecoration(
                  // image: ,
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 20.0,
                    ),
                  ]),
              // color: Colors.black.withOpacity(0.3),

              padding: EdgeInsets.fromLTRB(50, 27, 50, 7),
              child: ListView(
                children: [
                  Container(
                    child: Center(
                      child: (_load == true)
                          ? Container(
                              decoration: BoxDecoration(
                                  // color: Colors.white.withOpacity(0.7),
                                  ),
                              height: 350,
                              width: 400,
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  // color: Colors.white.withOpacity(0.7),
                                  ),
                              child: Column(
                                children: [
                                  Container(
                                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                      height: 350,
                                      width: 300,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.file(
                                          _imgToPredict,
                                          fit: BoxFit.fill,
                                        ),
                                      )),
                                  Divider(
                                    height: 30,
                                    thickness: 10,
                                  ),
                                  (_output != null)
                                      ? Text("Result : ${_output[0]['label']}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20))
                                      : Container(
                                          height: 30,
                                        ),
                                  Divider(
                                    height: 30,
                                    thickness: 10,
                                  )
                                ],
                              ),
                            ),
                    ),
                  ),
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                        // color: Colors.white.withOpacity(0.7),
                        ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => {
                            setState(() {
                              pickImageCamera();
                              // _gallery = false;
                              // uploadImage();
                            })
                          },
                          child: Container(
                            width: 200,
                            height: 60,
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    // begin: Alignment.bottomCenter,
                                    // end: Alignment.topCenter,
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      // Colors.red,
                                      // Colors.yellow,
                                      Colors.black,
                                      Colors.black,
                                      // Colors.grey[800],
                                      // Colors.purpleAccent,
                                      // Colors.purpleAccent
                                    ]),
                                // color: Colors.lightGreenAccent,
                                borderRadius: BorderRadius.circular(120),
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 10.0,
                                  ),
                                ]),
                            child: Text(
                              "Camera",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () => {
                            setState(() {
                              pickImageGallery();
                              output = _output[0]['label'];
                            })
                          },
                          child: Container(
                            width: 200,
                            height: 60,
                            // padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              boxShadow: [
                                new BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10.0,
                                ),
                              ],
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  // end: Alignment.bottomLeft,
                                  // begin: Alignment.topRight,
                                  colors: [
                                    // Colors.red,
                                    // Colors.yellow,
                                    Colors.black,
                                    Colors.black,

                                    // Colors.purpleAccent
                                  ]),
                              // color: Colors.lightGreenAccent,
                              borderRadius: BorderRadius.circular(120),
                            ),
                            child: Text(
                              "Gallery",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 30,
                        ),
                        (output == "PNEUMONIA")
                            ? GestureDetector(
                                onTap: () => showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: const Text(
                                      'You are detected with pneumonia',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 27,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    content: 
                                       Text(
                                          "1). Drink warm beverages, take steamy baths and use a humidifier to help open your airways and ease your breathing.\n\n2). Contact your doctor right away if your breathing gets worse instead of better over time.\n\n3). Stay away from smoke to let your lungs heal. This includes smoking, secondhand smoke and wood smoke.\n\n 4). Measure your respiratory rate which is calculating number of breaths per minute. If the rate is more than 24 then immediately contact your doctor.", 
                                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.black),),
        
                                      
                                    actions: <Widget>[
                                                                    TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK',
                                            textAlign: TextAlign.center),
                                      ),
                                    ],
                                  ),
                                ),
                                child: Container(
                                  width: 200,
                                  height: 60,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      new BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 10.0,
                                      ),
                                    ],
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.black,
                                          Colors.black,
                                        ]),
                                    borderRadius: BorderRadius.circular(120),
                                  ),
                                  child: Text(
                                    "View Prescription",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // main function which can give the output of the model by providing the input
  // you can refer to tensorflow library aswell to see the exact functioning of runModelOnImage
  classifyImage(File img) async {
    var output = await Tflite.runModelOnImage(
      path: img.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 150,
      imageStd: 150,
    );
    setState(() {
      _output = output!;
      _load = false;
    });
    setOutput();
  }

// the modelwill be loaded from tflite
  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/modelCNN.tflite', labels: 'assets/labels.txt');
  }

  // image from camera
  Future pickImageCamera() async {
    var image = await _picker.getImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    }

    setState(() {
      _imgToPredict = File(image.path);
    });

    classifyImage(_imgToPredict);
  }

  setOutput() {
    setState(() {
      output = _output[0]['label'];
    });
  }

  // image from gallery
  Future pickImageGallery() async {
    var image = await _picker.getImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }

    setState(() {
      _imgToPredict = File(image.path);
    });

    classifyImage(_imgToPredict);
  }

  // for popup we can use this function
  Future uploadImage() async {
    final _picker = ImagePicker();
    PickedFile? image;
    // if (PermissionStatus.granted != null) {
    image = ((_gallery)
        ? (_picker.getImage(source: ImageSource.gallery))
        : (await _picker.getImage(source: ImageSource.camera))) as PickedFile?;
    var file = File(image!.path);
    setState(() {
      _imgToPredict = File(image!.path);
    });
    classifyImage(_imgToPredict);
    // }
  }
}
