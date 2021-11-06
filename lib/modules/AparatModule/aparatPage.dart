// import 'dart:html';

import 'package:appbesaz/widgets/appbarWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

import '../../main.dart';

class AparatPage extends StatefulWidget {
  final String videoCode;
  AparatPage({required this.videoCode});

  @override
  _AparatPageState createState() => _AparatPageState();
}

class _AparatPageState extends State<AparatPage> {
  @override
  Widget build(BuildContext context) {
    futureAparatVideo = fetchAparatVideo(widget.videoCode);
    Map f;
    return FutureBuilder<AparatVideo>(
        future: futureAparatVideo,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            f = snapshot.data!.data;
            futureAparatProfile = fetchAparatProfile(f['username']);
            Map fap;
            return FutureBuilder<AparatProfile>(
              future: futureAparatProfile,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print('object');
                  fap = snapshot.data!.data;
                  return OrientationBuilder(builder: (context, orientation) {
                    return Scaffold(
                        appBar: AppbarWidget(
                          myText: f['title'],
                        ),
                        body: Center(
                          child: ListView(
                            children: <Widget>[
                              Container(
                                // width: 500,
                                // height: 300,
                                child: WebViewX(
                                  height: orientation == Orientation.portrait
                                      ? MediaQuery.of(context).size.height / 3
                                      : MediaQuery.of(context).size.height - 80,
                                  width: MediaQuery.of(context).size.width,
                                  initialContent:
                                      "https://www.aparat.com/video/video/embed/videohash/${widget.videoCode}/vt/frame",
                                  initialSourceType: SourceType.url,
                                ),
                                // child: WebViewX(height: 600, width: 500, initialContent: "https://www.appbesaz.com" ,initialSourceType: SourceType.url,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  f['title'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Aviny',
                                      color: Colors.black),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.visibility),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(f['visit_cnt'].toString()),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.favorite),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(f['like_cnt'].toString()),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.watch_later),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    f['sdate'],
                                    textDirection: TextDirection.rtl,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      child: Text(fap['name']),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CachedNetworkImage(
                                      imageUrl: fap['pic_m'],
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, bottom: 30),
                                child: Text(
                                  fap['descr'],
                                  textDirection: TextDirection.rtl,
                                ),
                              )
                            ],
                          ),
                        ));
                  });
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return Scaffold(
                  appBar: AppbarWidget(myText: f['title']),
                  body: Center(child: CircularProgressIndicator()),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: SafeArea(
                  child: Container(child: CircularProgressIndicator())),
            ),
            body: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
