import 'package:appbesaz/modules/AboutusModule/aboutusModule.dart';
import 'package:appbesaz/modules/settingsModule.dart';
import 'package:appbesaz/widgets/cardWidget.dart';
import 'package:flutter/material.dart';
import 'package:appbesaz/modules/ListModule/listModule.dart';
import 'package:appbesaz/modules/callModule.dart';
import 'package:appbesaz/modules/siteModule.dart';
import 'AparatModule/aparatModule.dart';

List<Module> moduleList = [];

Module? findModuleByIndex(int index) {
  for (Module a in moduleList) { // (0,0,..) , (1,2,...) (2,1,...)
    if (a.index == index) return a;
  }
}

void goUp(int index) {
  // This function swaps the indexes of the two modules.
  if (index < moduleList.length) {
    Module m = findModuleByIndex(index)!;
    Module n = findModuleByIndex(index - 1)!;
    m.index = index - 1;
    n.index = index;
  }
}

class Module extends StatefulWidget {
  final int id;
  int index;
  final int type; // 1 for call module, 2 for site module, 3 for list module, 4 for settings module, 5 aparat module ..... to be continued.
  final String title;
  final String imageName;
  bool visibility;
  Module({required this.id, required this.index, required this.type, this.title = '', this.imageName = '', this.visibility = true}) {
    moduleList.add(this);
  }
  void setVisibility(bool newVisibility) {
    visibility = newVisibility;
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ModuleState();
  }
}

class ModuleState extends State<Module> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    switch (widget.type) {
      case 1: 
        {
          CallModule cm = CallModule(
              id: widget.id,
              index: widget.index,
              title: widget.title,
              phoneNumber: findCallModuleById(widget.id)!.phoneNumber);
          return ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => cm));
              },
              child: Icon(Icons.call));
        }
      case 2:
        {
          SiteModule sm = SiteModule(
              id: widget.id,
              index: widget.index,
              title: widget.title,
              siteAddress: findSiteModuleById(widget.id)!.siteAddress);
          return ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => sm));
              },
              child: Icon(Icons.web));
        }
      case 3:
        {
          ListModule ls = ListModule(
              id: widget.id,
              title: findListModuleById(widget.id)!.title,
              index: widget.index);
          return ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ls));
              },
              child: Icon(Icons.list));
        }
      case 4:
        {
          SettingsModule sm = SettingsModule(
              id: widget.id,
              index: widget.index,
              font: findSettingsModuleById(widget.id)!.font,
              fontSize: findSettingsModuleById(widget.id)!.fontSize,
              isBold: findSettingsModuleById(widget.id)!.isBold,
              textColor: findSettingsModuleById(widget.id)!.textColor,
              appBarColor: findSettingsModuleById(widget.id)!.appBarColor,
              backgroundColor:
                  findSettingsModuleById(widget.id)!.backgroundColor,
              imageName: findSettingsModuleById(widget.id)!.imageName);
              return ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => sm));
              },
              child: Icon(Icons.list));
        }
      case 5:
        {
          AparatModule am = AparatModule(
            id: widget.id,
            index: widget.index,
            title: widget.title,
            uiList: findAparatModuleById(widget.id)!.uiList,
            uiOne: findAparatModuleById(widget.id)!.uiList,
            aparatType: findAparatModuleById(widget.id)!.aparatType,
            data: findAparatModuleById(widget.id)!.data);
          return ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => am));
                },
            child: Icon(Icons.web),
          );
        }
      case 15:
        {
          AboutusModule au = AboutusModule(
            id: widget.id,
            index: widget.index,
            graphics: findAboutusModuleById(widget.id)!.graphics,
            title: findAboutusModuleById(widget.id)!.title,
            text: findAboutusModuleById(widget.id)!.text,
            cardWidgetList: findAboutusModuleById(widget.id)!.cardWidgetList,
            iconLinkWidgetList: findAboutusModuleById(widget.id)!.iconLinkWidgetList,
          );
          return ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => au));
            },
            child: Icon(Icons.web),
          );
        }
      default:
        return Container();
    }
  }
}
