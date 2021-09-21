import 'package:flutter/material.dart';
import 'package:appbesaz/modules/module.dart';

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

    );
  }
  
}

