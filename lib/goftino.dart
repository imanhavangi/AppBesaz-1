import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

class Goftino extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GoftinoState();
  }
}

class GoftinoState extends State<Goftino> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('adsf'),
      ),
      body: Container(
        child: WebViewX(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          initialContent: 'https://www.goftino.com/c/QzcU28',
          initialSourceType: SourceType.url,
        ),
      ),
    );
  }
}
