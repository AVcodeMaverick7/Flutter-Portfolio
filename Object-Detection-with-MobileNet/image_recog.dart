import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';


class ObjectDetection extends StatefulWidget {
  @override
  _ObjectDetectionState createState() => _ObjectDetectionState();
}

class _ObjectDetectionState extends State<ObjectDetection> {

  File _image;
  double _imageWidth;
  double _imageHeight;
  var _recognitions;
  final ImagePicker _picker = ImagePicker();

  loadModel () async {
    Tflite.close();
    try {
      String res;
      res = await Tflite.loadModel(
        model: 'assets/mobileNet/mobileNet.tflite',
        labels: 'assets/mobileNet/labels.txt',
      );
      print(res);
    } on PlatformException {
      print('failed to load Model');
    }
  }

  // Run Predictions

  Future Predict(File image) async {

    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2,
      threshold: 0.2,
      asynch: true,
    );

    print(recognitions);

    setState(() {
      _recognitions = recognitions;
    });

  }

  sendImage(File image) async {

    if(image==null)
      return;
    await Predict(image);

    FileImage(image).resolve(ImageConfiguration()).addListener((ImageStreamListener((ImageInfo info,bool _) {
      setState(() {
        _imageWidth = info.image.width.toDouble();
        _imageHeight = info.image.height.toDouble();
        _image = image;
      });
    })));
  }

  selectFromGallery() async {
    PickedFile pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if(pickedFile==null)
      return;
    setState(() {

    });

    sendImage(File(pickedFile.path));
  }

  // select image from camera
  selectFromCamera() async {
    PickedFile pickedFile = await _picker.getImage(source: ImageSource.camera);
    if(pickedFile == null) return;
    setState(() {
    });
    sendImage(File(pickedFile.path));
  }

  @override
  void initState() {
    super.initState();

    loadModel().then((val) {
      setState(() {});
    });
  }

  Widget printValue(rcg) {
    if (rcg == null) {
      return Text('', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700));
    }else if(rcg.isEmpty){
      return Center(
        child: Text("Could not recognize", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
      );
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(0,0,0,0),
      child: Center(
        child: Text(
          "Prediction: "+_recognitions[0]['label'].toString().toUpperCase(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    double finalW;
    double finalH;

    if(_imageWidth==null && _imageHeight ==null) {
      finalW = size.width;
      finalH = size.height;
    } else {

      double ratioW = size.width / _imageWidth;
      double ratioH = size.height / _imageHeight;

      // final width and height after the ratio scaling is applied
      finalW = _imageWidth * ratioW*.85;
      finalH = _imageHeight * ratioH*.50;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Object Detection', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
            child: printValue(_recognitions),
        ),

          Padding(
            padding: EdgeInsets.fromLTRB(0,0,0,10),
            child: _image == null ? Center(child: Text("Select image from camera or gallery"),): Center(child: Image.file(_image, fit: BoxFit.fill, width: finalW, height: finalH)),
          ),

          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Container(
                  height: 50.0,
                  width: 150.0,
                  color: Colors.redAccent,
                  child: FlatButton.icon(
                      onPressed: selectFromCamera,
                      icon: Icon(Icons.camera_alt,
                      color: Colors.white,
                      size: 30,),
                      color: Colors.deepPurple,
                      label: Text('Camera', style: TextStyle(color: Colors.white, fontSize: 20),),),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                height: 50.0,
                width: 150.0,
                color: Colors.redAccent,
                child: FlatButton.icon(
                  onPressed: selectFromGallery,
                  icon: Icon(Icons.file_upload,
                    color: Colors.white,
                    size: 30,),
                  color: Colors.deepPurple,
                  label: Text('Gallery', style: TextStyle(color: Colors.white, fontSize: 20),),),
              ),
            ],
          )
        ],
      ),
    );
  }
}

