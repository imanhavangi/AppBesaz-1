import 'package:flutter/material.dart';
import 'package:appbesaz/modules/ListModule/listModule.dart';
import 'package:appbesaz/modules/ListModule/listTileModule.dart';
import 'package:appbesaz/modules/module.dart';
import 'package:appbesaz/modules/siteModule.dart';
import 'modules/callModule.dart';
import 'package:appbesaz/modules/settingsModule.dart';

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
          primarySwatch: appbarColor,
          
          appBarTheme: AppBarTheme(color: appbarColor)),
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
        backgroundColor: appbarColor,
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
                    : (findModuleByIndex(index)!.type == 3)
                        ? 'ListModule'
                        : 'SettingsModule';
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
          print(appbarColor.toString());

          setState(() {
            SettingsModule a = new SettingsModule(
              id: 2,
              index: 2,
              font: 0,
              fontSize: 11,
              isBold: true,
              textColor: Colors.black,
              appBarColor: Colors.blue,
              backgroundColor: Colors.white,
              imageName: "",
              mainSetState: () {
                setState(() {});
              },
            );
          });
        },
        tooltip: 'add call module',
        child: Icon(Icons.add),
      ),
    );
  }
}
