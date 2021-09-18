import 'package:flutter/material.dart';
import 'package:appbesaz/modules/ListModule/listTileExpand.dart';

List<ListTileModule> listTileModuleList = [];
List<ListTileModule> findListTileModuleByListId(int listId) {
  List<ListTileModule> ls = [];
  for (ListTileModule a in listTileModuleList) {
    if (a.parentId == listId) {
      ls.add(a);
    }
  }
  return ls;
}

class ListTileModule extends StatefulWidget {
  int id;
  int parentId;
  int index;
  String title;
  String summary;
  String content;
  // image must be added later...
  ListTileModule(
      {required this.id,
      required this.parentId,
      required this.index,
      required this.title,
      required this.summary,
      required this.content}) {
    listTileModuleList.add(this);
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListTileModuleState();
  }
}

class ListTileModuleState extends State<ListTileModule> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        onTap: () {
          ListTileExpand a =
              ListTileExpand(title: widget.title, content: widget.content);
          Navigator.push(context, MaterialPageRoute(builder: (context) => a));
        },
        child: Container(
          height: 100,
          width: 100,
          child: Column(
            children: [
              Text(
                widget.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(widget.summary),
            ],
          ),
        ));
  }
}
