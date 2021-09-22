import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:appbesaz/modules/module.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:webviewx/webviewx.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'dart:html';
// import 'dart:ui' as ui;

List<AparatModule> aparatModuleList = [];

AparatModule? findAparatModuleById(int id) {
  for (AparatModule a in aparatModuleList) {
    if (a.id == id) return a;
  }
}

class AparatModule extends Module {
  String link;

  AparatModule({required int id, required int index, required this.link}) : super(id: id, index: index, type: 5){
    aparatModuleList.add(this);
  }

  @override
  State<StatefulWidget> createState() {
    return AparatModuleState();
  }
}
class AparatModuleState extends State<AparatModule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('آپارات'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('data'),
            Container(
              width: 500,
              height: 300,
              // child: RichText(text: HTML.toTextSpan(context, '<body><p>slama</p><div id="68950433100"><script type="text/JavaScript" src="https://www.aparat.com/embed/zDu31?data[rnddiv]=68950433100&data[responsive]=yes"></script></div></body>')),
              child: WebViewX(height: 400, width: 600,initialContent: 'https://www.aparat.com/video/video/embed/videohash/PoF6Z/vt/frame' ,initialSourceType: SourceType.url,),

                // initialUrl: 'https://www.aparat.com/video/video/embed/videohash/PoF6Z/vt/frame',
                // javascriptMode: JavascriptMode.unrestricted,
              )
          ],
        )
      ),

    );
  }
  
}

