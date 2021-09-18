import 'package:flutter/material.dart';
import 'package:appbesaz/modules/module.dart';
import 'package:url_launcher/url_launcher.dart';

List<SiteModule> siteModuleList = [];
SiteModule? findSiteModuleById(int id) {
  for (SiteModule a in siteModuleList) {
    if (a.id == id) return a;
  }
}

class SiteModule extends Module {
  String siteAddress;

  SiteModule({required int id, required int index, required this.siteAddress})
      : super(id: id, index: index, type: 2) {
    siteModuleList.add(this);
  }
  @override
  State<StatefulWidget> createState() {
    return SiteModuleState();
  }
}

class SiteModuleState extends State<SiteModule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('آدرس سایت'),
        ),
        body: Center(
          child: Row(
            children: [
              Text('آدرس سایت' + widget.siteAddress),
              ElevatedButton(
                  onPressed: () {
                    launch(widget.siteAddress);
                  },
                  child: Icon(Icons.web))
            ],
          ),
        ));
  }
}
