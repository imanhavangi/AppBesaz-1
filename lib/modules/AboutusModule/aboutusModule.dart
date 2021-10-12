import 'package:appbesaz/widgets/cardWidget.dart';
import 'package:appbesaz/widgets/iconlinkWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../module.dart';

List<AboutusModule> aboutusModuleList = [];

AboutusModule? findAboutusModuleById(int id) {
  for (AboutusModule a in aboutusModuleList) {
    if (a.id == id) return a;
  }
}

class AboutusModule extends Module {
  int graphics;
  String title;
  String text;
  List<CardWidget> cardWidgetList;
  List<IconLinkWidget> iconLinkWidgetList;
  // List<String> _list;

  AboutusModule(
      {required int id,
      required int index,
      required this.graphics,
      required this.title,
      required this.text,
      required this.cardWidgetList,
      required this.iconLinkWidgetList})
      : super(id: id, index: index, type: 12) {
    aboutusModuleList.add(this);
  }
  @override
  State<StatefulWidget> createState() {
    return AboutusModuleState();
  }
}

class AboutusModuleState extends State<AboutusModule> {
  @override
  Widget build(BuildContext context) {
    Widget titleWidget = Text(
      widget.title,
      style: TextStyle(fontSize: 25, fontFamily: 'Aviny'),
      textDirection: TextDirection.rtl,
    );
    Widget textWidget = Text(
      widget.text,
      style: TextStyle(fontSize: 15),
      textDirection: TextDirection.rtl,
    );
    Widget cardWidget = ListView.builder(
      shrinkWrap: true,
      // padding: EdgeInsets.only(bottom: 10),
      itemCount: widget.cardWidgetList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: widget.cardWidgetList[index],
        );
      },
    );
    Widget iconsWidget = ListView.builder(
      padding: EdgeInsets.only(left: 20),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: widget.iconLinkWidgetList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          // width: double.infinity,
          // alignment: Alignment.center,
          padding: EdgeInsets.only(right: 15),
          child: widget.iconLinkWidgetList[index],
        );
      },
    );
    switch (widget.graphics) {
      case 1:
        return Scaffold(
            appBar: AppBar(
              title: Text('About Us'),
            ),
            body: Stack(
              children: [
                Positioned(
                  // top: 10,
                  child: Container(
                    // color: Colors.deepPurple,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30)),
                        color: Colors.deepPurple),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .1 - 35),
                      child: Text(
                        'درباره ما گرافیک 1',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 40, fontFamily: 'Aviny'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // top: 10,
                  // right: 20,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .25 - 50,
                        right: 35,
                        left: 35),
                    child: Container(
                      padding: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black54),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      child: ListView(
                        // shrinkWrap: true,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 1, right: 20),
                            child: titleWidget,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 1, right: 35, left: 30),
                            child: textWidget,
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 30, right: 25, left: 25),
                            child: cardWidget,
                          ),
                          Container(
                            height: 150,
                            child: iconsWidget,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ));
      case 2:
        return Scaffold(
            appBar: AppBar(
              title: Text('About Us'),
            ),
            body: Stack(
              children: [
                Positioned(
                  // top: 10,
                  child: Container(
                    // color: Colors.deepPurple,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30)),
                        color: Colors.deepPurple),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .1 - 35),
                      child: Text(
                        'درباره ما گرافیک 2',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 40, fontFamily: 'Aviny'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // top: 10,
                  // right: 20,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .25 - 50,
                        right: 35,
                        left: 35),
                    child: Container(
                      padding: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black54),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      child: ListView(
                        // shrinkWrap: true,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 1, right: 20),
                            child: titleWidget,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 1, right: 35, left: 30),
                            child: textWidget,
                          ),
                          Container(
                            height: 150,
                            child: iconsWidget,
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 10, right: 25, left: 25),
                            child: cardWidget,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ));
      case 3:
        return Scaffold(
            appBar: AppBar(
              title: Text('About Us'),
            ),
            body: Stack(
              children: [
                Positioned(
                  // top: 10,
                  child: Container(
                    // color: Colors.deepPurple,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30)),
                        color: Colors.deepPurple),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .1 - 40),
                      child: Text(
                        'درباره ما گرافیک 3',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 40, fontFamily: 'Aviny'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // top: 10,
                  // right: 20,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .25 - 40,
                        right: 35,
                        left: 35),
                    child: Container(
                      padding: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black54),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      child: ListView(
                        // shrinkWrap: true,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 1, right: 20),
                            child: titleWidget,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 1, right: 35, left: 30),
                            child: textWidget,
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 10, right: 25, left: 25),
                            child: cardWidget,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 40,
                        top: MediaQuery.of(context).size.height * .25 - 115),
                    child: Container(
                      height: 150,
                      child: iconsWidget,
                    ),
                  ),
                ),
              ],
            ));
      case 4:
        return Scaffold(
            appBar: AppBar(
              title: Text('About Us'),
            ),
            body: Stack(
              children: [
                Positioned(
                  // top: 10,
                  child: Container(
                    // color: Colors.deepPurple,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .22,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30)),
                        color: Colors.deepPurple),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .01
                        ),
                      child: Text(
                        'درباره ما گرافیک 4',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 35, fontFamily: 'Aviny'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // top: 10,
                  // right: 20,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .18,
                        right: 35,
                        left: 35),
                    child: Column(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height * .25,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black54),
                                borderRadius: BorderRadius.all(Radius.circular(15))),
                            padding: EdgeInsets.only(right: 20),
                            child: ListView(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(right: 35, left: 30),
                                  child: titleWidget,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 35, left: 30),
                                  child: textWidget,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .01,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * .3,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black54),
                                borderRadius: BorderRadius.all(Radius.circular(15))),
                            padding:
                                EdgeInsets.only(top: 20, right: 25, left: 25),
                            child: cardWidget,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * .1,
                            child: iconsWidget,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .01,
                          ),
                        ]),
                  ),
                ),
              ],
            ));
      case 5:

      default:
        return Scaffold(
            appBar: AppBar(
              title: Text('About Us'),
            ),
            body: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: titleWidget,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: textWidget,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: cardWidget,
                ),
                Container(
                  // padding: EdgeInsets.only(left: 100),
                  // width: double.infinity,
                  alignment: Alignment.center,
                  height: 200,
                  child: iconsWidget,
                )
              ],
            ));
    }
  }
}
