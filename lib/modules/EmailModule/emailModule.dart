import 'package:flutter/material.dart';
import 'package:appbesaz/modules/module.dart';
import 'package:url_launcher/url_launcher.dart';

List<EmailModule> emailModuleList = [];
EmailModule? findEmailModuleById(int id) {
  for (EmailModule a in emailModuleList) {
    if (a.id == id) return a;
  }
}

class EmailModule extends Module {
  final String email;
  final String subject;
  EmailModule(
      {required int id,
      required int index,
      required String title,
      required this.email,
      required this.subject})
      : super(id: id, index: index, title: title, type: 1) {
    emailModuleList.add(this);
  }
  @override
  State<StatefulWidget> createState() {
    return EmailModuleState();
  }
}

class EmailModuleState extends State<EmailModule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  void email() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: widget.email,
      query: 'subject=${widget.subject}', //add subject and body here
    );
    var uri = params.toString();

    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
  
  void initState() {
    super.initState();
    email();
    Navigator.pop(context);
  }
}