import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  String title;
  String text;
  String image;

  CardWidget({required this.title, required this.text, required this.image}){

  }

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(10),
      height: 142,
      padding: EdgeInsets.only(right: 5, top: 5, bottom: 5),
      decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 0.3), borderRadius: BorderRadius.all(Radius.circular(10)),boxShadow: [BoxShadow(blurRadius: 2)],color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                // height: 30,
                // margin: EdgeInsets.zero,
                padding: EdgeInsets.only(top: 5),
                child: Text(widget.title, textDirection: TextDirection.rtl, style: TextStyle(fontSize: 18),),
              ),
              Container(
                width: MediaQuery.of(context).size.width-250, //*******
                padding: EdgeInsets.only(top: 10,left: 5),
                child: Text(widget.text, textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),),),
            ],
          ),
          Container(
            width: 110,
            height: 110,
            // padding: EdgeInsets.only(right: 500),
            decoration: BoxDecoration(
              // border: BoxBorder(),
              // border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(image: AssetImage(widget.image)),
            ),
            // child: Image.asset(widget.image),
          ),
        ],
      ),
    );
  }
}
