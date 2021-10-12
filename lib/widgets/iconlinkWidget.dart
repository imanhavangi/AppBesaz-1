import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IconLinkWidget extends StatefulWidget {
  double size;
  // double widh;
  String link;
  String image;

  IconLinkWidget({required this.size, required this.link, required this.image}){

  }

  @override
  _IconLinkWidgetState createState() => _IconLinkWidgetState();
}

class _IconLinkWidgetState extends State<IconLinkWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        launch(widget.link);
      },
      child: Container(
        // padding: EdgeInsets.all(10),
        // alignment: Alignment.center,
        height: widget.size,
        width: widget.size,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(widget.image)),
        ),
      ),
    );
  }
}
