import 'package:flutter/material.dart';
import 'package:appbesaz/modules/module.dart';
import 'package:url_launcher/url_launcher.dart';

List<CallModule> callModuleList = [];
CallModule? findCallModuleById(int id) {
  for (CallModule a in callModuleList) {
    if (a.id == id) return a;
  }
}

class CallModule extends Module {
  final String phoneNumber;

  CallModule({required int id, required int index, required String title, required this.phoneNumber})
      : super(id: id, index: index, title: title, type: 1) {
    callModuleList.add(this);
  }
  @override
  State<StatefulWidget> createState() {
    return CallModuleState();
  }
}

class CallModuleState extends State<CallModule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('تماس'),
        ),
        body: Center(
          child: Row(
            children: [
              Text('شماره تماس: ' + widget.phoneNumber),
              ElevatedButton(
                  onPressed: () {
                    launch("tel://" + widget.phoneNumber);
                  },
                  child: Icon(Icons.call))
            ],
          ),
        ));
  }
}
