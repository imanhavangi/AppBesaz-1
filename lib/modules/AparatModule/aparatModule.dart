import 'dart:convert';
import 'dart:io';

import 'package:appbesaz/widgets/appbarWidget.dart';
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
import 'package:cached_network_image/cached_network_image.dart';
import '../../main.dart';

List<AparatModule> aparatModuleList = [];

AparatModule? findAparatModuleById(int id) {
  for (AparatModule a in aparatModuleList) {
    if (a.id == id) return a;
  }
}

late Size size;

class DialogonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(
        0.0, size.height * .2 > size.height ? size.height : size.height * .2);
    path.lineTo(size.width, size.height * .15);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class AparatModule extends Module {
  int uiOne;
  int uiList;
  int aparatType; //1: just one video | 2: list of videos | 3: list of videos of a channel
  String data;

  AparatModule(
      {required int id,
      required int index,
      required title,
      required this.uiOne,
      required this.uiList,
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
    size = MediaQuery.of(context).size;
    switch (widget.aparatType) {
      case 1:
        return AparatPage(videoCode: widget.data);
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
        switch (widget.uiList) {
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
                                          image: AssetImage('assets/iman.jpg')),
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
                                      builder: (context) => AparatPage(
                                          videoCode: videos[index])));
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
            size = MediaQuery.of(context).size;
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
                          Image(
                            image: AssetImage('assets/back2.jpg'),
                            width: MediaQuery.of(context).size.width,
                          ),
                        ]),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .2,
                      alignment: Alignment.center,
                      child: Text(
                        'لیست فیلم ها',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 35,
                            fontFamily: 'Aviny',
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .2,
                          left: MediaQuery.of(context).size.width * .05,
                          right: MediaQuery.of(context).size.width * .05),
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
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  // mainAxisAlignment:
                                  // MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .6,
                                      // height: 100,
                                      padding: EdgeInsets.only(top: 10),
                                      child: vlajw[index],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 100,
                                      width: 100,
                                      padding: EdgeInsets.only(
                                          top: 5, bottom: 5, left: 20),
                                      decoration: BoxDecoration(
                                        // border: BoxBorder(),
                                        // border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        image: DecorationImage(
                                            image:
                                                AssetImage('assets/iman.jpg')),
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
                                        builder: (context) => AparatPage(
                                            videoCode: videos[index])));
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
        futureAparatChannel = fetchAparatChannel(widget.data);
        List f = [];
        Map fap;
        return FutureBuilder<AparatChannel>(
          future: futureAparatChannel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              f = snapshot.data!.data;
              futureAparatProfile = fetchAparatProfile(widget.data);
              return FutureBuilder<AparatProfile>(
                  future: futureAparatProfile,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      fap = snapshot.data!.data;
                      switch (widget.uiList) {
                        case 0:
                          return Scaffold(
                            appBar: AppBar(
                              title: Text('لیست فیلم ها'),
                            ),
                            body: Stack(
                              alignment: Alignment.center,
                              children: [
                                Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  4 -
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  10,
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                'https://wallpaperboat.com/wp-content/uploads/2020/10/04/55622/blonde-anime-girl-14.jpg',
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                fit: BoxFit.fitWidth,
                                                image: imageProvider,
                                                opacity: 0.4,
                                              )),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height:
                                              size.height / 4 - size.width / 10,
                                          alignment: Alignment.center,
                                          child: Text(
                                            fap['name'],
                                            style: TextStyle(
                                                fontFamily: 'aviny',
                                                fontSize: 40),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 15,
                                      color: Colors.white,
                                    ),
                                    Expanded(
                                      // height: MediaQuery.of(context).size.height/10*9,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: f.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.white,
                                                onPrimary: Colors.black),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                // mainAxisAlignment:
                                                // MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .6,
                                                    // height: 100,
                                                    padding: EdgeInsets.only(
                                                        top: 10),
                                                    child: Text(
                                                      f[index]['title'],
                                                      textDirection:
                                                          TextDirection.rtl,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  CachedNetworkImage(
                                                    imageUrl: f[index]
                                                        ['small_poster'],
                                                    imageBuilder: (context,
                                                            imageProvider) =>
                                                        Container(
                                                      width: 120,
                                                      height: 67,
                                                      decoration: BoxDecoration(
                                                        // shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                            image:
                                                                imageProvider,
                                                            fit: BoxFit.cover),
                                                      ),
                                                    ),
                                                    placeholder: (context,
                                                            url) =>
                                                        CircularProgressIndicator(),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Icon(Icons.error),
                                                  ),
                                                  // ClipOval(
                                                  //     child: Image.asset('iman.jpg', height: 50,width: 50, fit: BoxFit.cover)
                                                  // ),
                                                ],
                                              ),
                                            ),
                                            onPressed: () {
                                              print(f[index]['small_poster']);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AparatPage(
                                                              videoCode: f[
                                                                      index]
                                                                  ["uid"])));
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                    width: MediaQuery.of(context).size.width,
                                    top:
                                        MediaQuery.of(context).size.height / 5 -
                                            45,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'تعداد ویدئو ها: ${fap["video_cnt"]}',
                                            style: TextStyle(
                                                fontFamily: 'aviny',
                                                fontSize: 22),
                                          ),
                                          Text(
                                            'تعداد فالوور ها: ${fap["follower_cnt"]}',
                                            style: TextStyle(
                                                fontFamily: 'aviny',
                                                fontSize: 22),
                                          ),
                                        ],
                                      ),
                                    )),
                                Positioned(
                                  top: MediaQuery.of(context).size.height / 5 -
                                      MediaQuery.of(context).size.width / 10,
                                  child: CachedNetworkImage(
                                    imageUrl: fap['pic_m'],
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      height:
                                          MediaQuery.of(context).size.width / 5,
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
                                ),
                              ],
                            ),
                          );
                        case 1:
                          return OrientationBuilder(
                              builder: (context, orientation) {
                            var h = size.height;
                            var w = size.width;
                            orientation == Orientation.portrait
                                ? {h = size.height, w = size.width}
                                : {w = size.height, h = size.width};
                            return Scaffold(
                              appBar: AppbarWidget(myText: fap['name']),
                              // appBar: AppBar(
                              //   title: Text('data'),
                              // ),
                              body: Column(
                                children: <Widget>[
                                  orientation == Orientation.portrait
                                      ? Stack(
                                          children: <Widget>[
                                            orientation == Orientation.portrait
                                                ? Container(
                                                    height: h / 8,
                                                    color: Colors.black,
                                                  )
                                                : Container(),
                                            orientation == Orientation.portrait
                                                ? Container(
                                                    alignment: Alignment.center,
                                                    padding: EdgeInsets.only(
                                                        top: h / 8 - w / 10),
                                                    child: CachedNetworkImage(
                                                      imageUrl: fap['pic_m'],
                                                      imageBuilder: (context,
                                                              imageProvider) =>
                                                          Container(
                                                        width: w / 5,
                                                        height: w / 5,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.white,
                                                              width: 3),
                                                          shape:
                                                              BoxShape.circle,
                                                          image: DecorationImage(
                                                              image:
                                                                  imageProvider,
                                                              fit:
                                                                  BoxFit.cover),
                                                        ),
                                                      ),
                                                      placeholder: (context,
                                                              url) =>
                                                          CircularProgressIndicator(),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.error),
                                                    ),
                                                  )
                                                : Container(),
                                            Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.only(top: 10),
                                              child: Text(
                                                fap['name'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    top: h / 8 - 25, left: 10),
                                                child: Text(
                                                  'تعداد فالوور ها : ${fap['follower_cnt']}',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    top: h / 8 - 25, right: 10),
                                                child: Text(
                                                  'تعداد ویدئو ها : ${fap['video_cnt']}',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container(),
                                  Expanded(
                                    child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent:
                                                    orientation ==
                                                            Orientation.portrait
                                                        ? w
                                                        : size.width / 2,
                                                childAspectRatio: 3 / 2,
                                                // crossAxisSpacing: 20,
                                                mainAxisSpacing: 20),
                                        shrinkWrap: true,
                                        itemCount: f.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AparatPage(
                                                              videoCode: f[
                                                                      index]
                                                                  ["uid"])));
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  left: 35,
                                                  right: 35,
                                                  bottom: 20),
                                              height: 235,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  color: Colors.grey[200]),
                                              // color: Colors.red,
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    height: 180,
                                                    child: CachedNetworkImage(
                                                      imageUrl: f[index]
                                                          ['big_poster'],
                                                      imageBuilder: (context,
                                                              imageProvider) =>
                                                          Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            10),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            10)),
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image:
                                                                      imageProvider,
                                                                )),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: 5, left: 5),
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Text(
                                                      f[index]['title'],
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons.watch_later,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          f[index]['sdate'],
                                                          textDirection:
                                                              TextDirection.rtl,
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Icon(Icons.visibility),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(f[index]
                                                                ['visit_cnt']
                                                            .toString()),
                                                        // Icon(Icons.favorite),
                                                        // Text(f[index][])
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            );
                          });
                      }
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return Scaffold(
                      appBar: AppBar(
                        flexibleSpace: SafeArea(
                            child:
                                Container(child: CircularProgressIndicator())),
                      ),
                      body: Center(child: CircularProgressIndicator()),
                    );
                  });
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
          },
        );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('آپارات'),
      ),
      body: WebViewX(
        height: 700,
        width: 500,
        initialContent: "https://www.appbesaz.com",
        initialSourceType: SourceType.url,
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width / 2 - 50, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 80, size.width / 2 + 50, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
