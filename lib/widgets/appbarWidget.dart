import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppbarWidget extends AppBar {
  // String myText;

  AppbarWidget({required String myText})
      : super(
            title: Text(
          myText,
          textDirection: TextDirection.rtl,
        ));

  @override
  _AppbarWidgetState createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      title: widget.title,
      // leading: IconButton(icon: Icon(Icons.ac_unit), onPressed: () => Scaffold.,),
      actions: [ElevatedButton(onPressed: () {}, child: Icon(Icons.ac_unit))],
      // flexibleSpace: SafeArea(child: Container(child: widget.title))
    );
  }
}
