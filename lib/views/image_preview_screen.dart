import 'dart:io';
import 'dart:typed_data';

import "package:flutter/material.dart";
import 'package:path/path.dart';

class ImagePreviewScreen extends StatefulWidget {
  final String imagePath;

  ImagePreviewScreen({this.imagePath});

  @override
  _ImagePreviewScreenState createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Image.file(File(widget.imagePath), fit: BoxFit.cover)),
            SizedBox(height: 10.0),
            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(60.0),
                child: RaisedButton(
                  onPressed: () {
                    // getBytesFromFile().then((bytes) {
                    //   Share.file('Share via:', basename(widget.imagePath),
                    //       bytes.buffer.asUint8List(), 'image/png');
                    // });
                  },
                  child: Text('Perform Action'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<ByteData> getBytesFromFile() async {
    Uint8List bytes = File(widget.imagePath).readAsBytesSync();
    return ByteData.view(bytes.buffer);
  }
}
