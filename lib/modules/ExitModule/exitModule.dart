import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:appbesaz/modules/module.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

List<ExitModule> exitModuleList = [];
ExitModule? findExitModuleById(int id) {
  for (ExitModule a in exitModuleList) {
    if (a.id == id) return a;
  }
}

class ExitModule extends Module {
  ExitModule({required int id, required int index, required String title})
      : super(id: id, index: index, title: title, type: 1) {
    exitModuleList.add(this);
  }
  @override
  State<StatefulWidget> createState() {
    return ExitModuleState();
  }
}

class ExitModuleState extends State<ExitModule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  void initState() {
    super.initState();
    (kIsWeb) ? Navigator.pop(context) : exit(0);
  }
}
