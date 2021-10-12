import 'dart:convert';
import 'dart:io';

import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:appbesaz/modules/AparatModule/aparatPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:appbesaz/modules/module.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:webviewx/webviewx.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'dart:html';
// import 'dart:ui' as ui;
import 'package:http/http.dart' as http;

import '../../main.dart';

List<AparatModule> aparatModuleList = [];

AparatModule? findAparatModuleById(int id) {
  for (AparatModule a in aparatModuleList) {
    if (a.id == id) return a;
  }
}

late MediaQueryData mediaQueryData;

class DialogonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0.0, mediaQueryData.size.height * .2 > size.height? size.height:mediaQueryData.size.height * .2);
    path.lineTo(size.width, mediaQueryData.size.height * .15);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class AparatModule extends Module {
  int graphics;
  int aparatType; //1: just one video | 2: list of videos | 3: list of videos of a channel
  String data;

  AparatModule(
      {required int id,
      required int index,
      required title,
      required this.graphics,
      required this.aparatType,
      required this.data})
      : super(id: id, index: index, title: title, type: 5) {
    aparatModuleList.add(this);
  }

  void editAparatModule(int aparatType, String data) {
    // super.index = index;
    this.aparatType = aparatType;
    this.data = data;
  }

  @override
  State<StatefulWidget> createState() {
    return AparatModuleState();
  }
}

class AparatModuleState extends State<AparatModule> {
  @override
  Widget build(BuildContext context) {
    switch (widget.aparatType) {
      case 1:
        return AparatPage(video: widget.data);
      case 2:
        // json.decode(vla1);
        // var vla1j = json.decode(vla1);
        // var vla2j = json.decode(vla2);
        List vlaj = [
          'سرویس تبلیغات در آپارات؛ ویترینی به وسعت ۶۰ میلیون مخاطب',
          'نگاه نزدیک به سرفیس های جدید مایکروسافت و کنفرانس معرفی ویندوز ۱۱ و سرفس ۲۰۲۱'
        ];
        List<Widget> vlajw = [];
        for (int i = 0; i < vlaj.length; i++) {
          vlajw.add(Text(
            vlaj[i],
            textDirection: TextDirection.rtl,
          ));
        }
        List<String> videos = widget.data.split(",");
        // AparatPage(video: video)
        switch (widget.graphics) {
          case 0:
            return OrientationBuilder(builder: (context, orientation) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('لیست فیلم ها'),
                ),
                body: Column(children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 4.0 - 30,
                    width: MediaQuery.of(context).size.width,
                    // padding: EdgeInsets.only(top: 10),
                    // color: Colors.red,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .01),
                      child: Text(
                        'لیست فیلم ها',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 35, fontFamily: 'Aviny'),
                      ),
                    ),
                  ),
                  Container(
                    // padding: EdgeInsets.only(left: 100, right: ),
                    // padding: EdgeInsets.only(top: -10),
                    height:
                        MediaQuery.of(context).size.height * (3.0 / 4.0) - 30,
                    child: ListView.builder(
                      itemCount: videos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 5, right: 30, left: 30),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.black.withOpacity(0.05),
                                onPrimary: Colors.black),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 210,
                                    // height: 100,
                                    padding: EdgeInsets.only(top: 10),
                                    child: vlajw[index],
                                  ),
                                  Container(
                                    height: 100,
                                    width: 100,
                                    padding: EdgeInsets.only(
                                        top: 5, bottom: 5, left: 20),
                                    decoration: BoxDecoration(
                                      // border: BoxBorder(),
                                      // border: Border.all(color: Colors.black),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                          image: AssetImage('iman.jpg')),
                                    ),
                                  )
                                  // ClipOval(
                                  //     child: Image.asset('iman.jpg', height: 50,width: 50, fit: BoxFit.cover)
                                  // ),
                                ],
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AparatPage(video: videos[index])));
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ]),
              );
            });
          case 1:
            mediaQueryData = MediaQuery.of(context);
            return Scaffold(
                appBar: AppBar(
                  title: Text('Aparat Module'),
                ),
                body: Stack(
                  children: [
                    Positioned(
                      // top: 10,
                      child: ClipPath(
                        clipper: new DialogonalClipper(),
                        // color: Colors.deepPurple,
                        child: Stack(children: <Widget>[
                          Image(image: AssetImage('back2.jpg'), width: MediaQuery.of(context).size.width,),
                        ]),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .2,
                      alignment: Alignment.center,
                      child: Text(
                        'لیست فیلم ها',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 35, fontFamily: 'Aviny', color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.2, left: MediaQuery.of(context).size.width*.05, right: MediaQuery.of(context).size.width*.05),
                      child: ListView.builder(
                        itemCount: videos.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.black),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  // mainAxisAlignment:
                                  // MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width*.6,
                                      // height: 100,
                                      padding: EdgeInsets.only(top: 10),
                                      child: vlajw[index],
                                    ),
                                    SizedBox(width: 10,),
                                    Container(
                                      height: 100,
                                      width: 100,
                                      padding: EdgeInsets.only(
                                          top: 5, bottom: 5, left: 20),
                                      decoration: BoxDecoration(
                                        // border: BoxBorder(),
                                        // border: Border.all(color: Colors.black),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                        image: DecorationImage(
                                            image: AssetImage('iman.jpg')),
                                      ),
                                    )
                                    // ClipOval(
                                    //     child: Image.asset('iman.jpg', height: 50,width: 50, fit: BoxFit.cover)
                                    // ),
                                  ],
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AparatPage(video: videos[index])));
                              },
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ));
            break;
          default:
        }
        break;
      case 3:
        var bin = json.decode(s);
        List videosC = bin["videobyuser"];
        for (var i = 0; i < videosC.length; i++) {
          print(videosC[i]["uid"]);
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('لیست فیلم ها'),
          ),
          body: Center(
              child: ListView.builder(
            itemCount: videosC.length,
            itemBuilder: (BuildContext context, int index) {
              return ElevatedButton(
                child: Text(videosC[index]["title"]),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AparatPage(video: videosC[index]["uid"])));
                },
              );
            },
          )),
        );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('آپارات'),
      ),
    );
  }
}
