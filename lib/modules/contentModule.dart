import 'module.dart';
import 'package:flutter/material.dart';

class ContentModule extends Module {
  List<Module> contentModuleList;
  Function mainSetState;
  int graphics;
  ContentModule({
    required int id,
    required int index,
    required this.contentModuleList,
    required this.mainSetState,
    required this.graphics,
  }) : super(id: id, index: index, type: 17) {
    for (Module a in contentModuleList) {
      a.setVisibility(false);
    }
  }

  void addModule(Module m) {
    contentModuleList.add(m);
    m.setVisibility(false);
  }

  void deleteModule(Module d) {
    contentModuleList.remove(d);
    d.setVisibility(true);
    mainSetState();
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContentModuleState();
  }
}

class ContentModuleState extends State<ContentModule> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('this is content module');
    switch (widget.graphics) {
      case 0:
        return Scaffold(
          appBar: AppBar(
            title: Text('ماژول فهرست'),
          ),
          body: ListView(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .2,
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    // border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Text(
                  'فهرست تو در توی 1',
                  style: TextStyle(fontSize: 35, fontFamily: 'Aviny'),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.contentModuleList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 100,
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      widget.contentModuleList[index]));
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                widget.contentModuleList[index].title,
                                style: TextStyle(
                                    fontSize: 25, fontFamily: 'Aviny'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  image: DecorationImage(
                                      image: AssetImage('youtube.jpg')),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                widget.deleteModule(widget
                    .contentModuleList[widget.contentModuleList.length - 1]);
              });
            },
          ),
        );
      case 1:
        return Scaffold(
          appBar: AppBar(
            title: Text('ماژول فهرست'),
          ),
          body: ListView(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .2,
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    // border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Text(
                  'فهرست تو در توی 1',
                  style: TextStyle(fontSize: 35, fontFamily: 'Aviny'),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  // semanticChildCount: 2,
                  shrinkWrap: true,
                  itemCount: widget.contentModuleList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 100,
                      padding: const EdgeInsets.only(bottom: 20, right: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      widget.contentModuleList[index]));
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                widget.contentModuleList[index].title,
                                style: TextStyle(
                                    fontSize: 25, fontFamily: 'Aviny'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  image: DecorationImage(
                                      image: AssetImage('youtube.jpg')),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                widget.deleteModule(widget
                    .contentModuleList[widget.contentModuleList.length - 1]);
              });
            },
          ),
        );
      case 2:
        return Scaffold(
          appBar: AppBar(
            title: Text('ماژول فهرست'),
          ),
          body: ListView(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .2,
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    // border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Text(
                  'فهرست تو در توی 1',
                  style: TextStyle(fontSize: 35, fontFamily: 'Aviny'),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  shrinkWrap: true,
                  itemCount: widget.contentModuleList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      // height: 300,
                      padding: const EdgeInsets.only(bottom: 20, right: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      widget.contentModuleList[index]));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                    image: AssetImage('youtube.jpg')),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              widget.contentModuleList[index].title,
                              style:
                                  TextStyle(fontSize: 25, fontFamily: 'Aviny'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                widget.deleteModule(widget
                    .contentModuleList[widget.contentModuleList.length - 1]);
              });
            },
          ),
        );
      case 3:
        return Scaffold(
          appBar: AppBar(
            title: Text('ماژول فهرست'),
          ),
          body: ListView(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .2,
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    // border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Text(
                  'فهرست تو در توی 1',
                  style: TextStyle(fontSize: 35, fontFamily: 'Aviny'),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.contentModuleList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    widget.contentModuleList[index]));
                      },
                      child: Container(
                        height: 200,
                        // decoration: BoxDecoration(
                        //   border: Border.all(color: Colors.black),
                        //   borderRadius: BorderRadius.all(Radius.circular(20)),
                        // ),
                        child: Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height,
                              // width: 70,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                    fit:BoxFit.cover,
                                    image: AssetImage('back1.jpg'), opacity: 0.8),

                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              // height: 150,
                              // padding: const EdgeInsets.only(bottom: 20, right: 20),
                              child: Text(
                                widget.contentModuleList[index].title,
                                style: TextStyle(
                                    fontSize: 25, fontFamily: 'Aviny'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                widget.deleteModule(widget
                    .contentModuleList[widget.contentModuleList.length - 1]);
              });
            },
          ),
        );
      default:
        return Container();
    }
  }
}
