import 'package:flutter/material.dart';
import 'package:appbesaz/modules/module.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constants.dart';

MaterialColor appbarColor = Colors.blue;
List<SettingsModule> settingsModuleList = [];
SettingsModule? findSettingsModuleById(int id) {
  for (SettingsModule a in settingsModuleList) {
    if (a.id == id) {
      return a;
    }
  }
}

class SettingsModule extends Module {
  int font;

  /// 1 irannastaliq, 2 titr, 3 b yekan, ...

  double fontSize;
  bool isBold;

  /// false: not bold, true: bold.

  Color textColor;
  Color appBarColor;
  Color backgroundColor;
  String imageName;
  Function? mainSetState;
  SettingsModule(
      {required int id,
      required int index,
      required this.font,
      required this.fontSize,
      required this.isBold,
      required this.textColor,
      required this.appBarColor,
      required this.backgroundColor,
      required this.imageName,
      this.mainSetState})
      : super(id: id, index: index, type: 4) {
    settingsModuleList.add(this);
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SettingsModuleState();
  }
}

class SettingsModuleState extends State<SettingsModule> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                widget.appBarColor = Colors.orange;
                appbarColor = Colors.orange;
              },
              child: Text('appbar orange')),
          Container(
            height: 50,
            width: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: fonts.length,
                itemBuilder: (BuildContext context, int index) {
                  return ElevatedButton(
                    child: Text(
                      fonts[index],
                      style: TextStyle(fontFamily: fonts[index]),
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(),
                  );
                }),
          ),
          ElevatedButton(
              onPressed: () {
                widget.mainSetState!();
              },
              child: Text('submit'))
        ],
      ),
    );
  }
}
