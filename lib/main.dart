import 'package:flutter/material.dart';
import 'package:appbesaz/modules/ListModule/listModule.dart';
import 'package:appbesaz/modules/ListModule/listTileModule.dart';
import 'package:appbesaz/modules/module.dart';
import 'package:appbesaz/modules/siteModule.dart';
import 'modules/callModule.dart';

int a = 0;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SiteModule s =
      new SiteModule(id: 0, index: 0, siteAddress: 'https://www.google.com');
  CallModule c = new CallModule(id: 1, index: 1, phoneNumber: '112');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(moduleList.length.toString()),
      ),
      body: ListView.builder(
          itemCount: moduleList.length,
          itemBuilder: (BuildContext context, int index) {
            ScrollController _controller;
            String s = (findModuleByIndex(index)!.type == 1)
                ? 'CallModule'
                : (findModuleByIndex(index)!.type == 2)
                    ? 'SiteModule'
                    : 'ListModule';
            return Container(
                height: 100,
                width: 100,
                child: ElevatedButton(
                  child: Text(index.toString() + s),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => findModuleByIndex(index)!));
                  },
                ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            CallModule c = new CallModule(
                id: moduleList.length,
                index: moduleList.length,
                phoneNumber: '110');
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
