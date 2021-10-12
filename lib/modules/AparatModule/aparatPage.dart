// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

class AparatPage extends StatefulWidget {
  final String video;
  AparatPage({required this.video});

  @override
  _AparatPageState createState() => _AparatPageState();
}

class _AparatPageState extends State<AparatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('آپارات'),
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              Text('Video:'),
              Container(
                // width: 500,
                // height: 300,
                child: WebViewX(height: 300, width: 500, initialContent: "https://www.aparat.com/video/video/embed/videohash/${widget.video}/vt/frame" ,initialSourceType: SourceType.url,),
              )
            ],
          )
      ),
    );
  }
}
