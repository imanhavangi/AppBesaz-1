import 'package:flutter/material.dart';

class ListTileExpand extends StatelessWidget {
  String title;
  String content;
  ListTileExpand({required this.title, required this.content});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Text(content),
    );
  }
}
