import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:appbesaz/modules/module.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

List<OfflineGalleryModule> offlineGalleryModuleList = [];
OfflineGalleryModule? findOfflineGalleryModuleById(int id) {
  for (OfflineGalleryModule a in offlineGalleryModuleList) {
    if (a.id == id) return a;
  }
}

class ImageOffline {
  final String title;
  final String name;
  ImageOffline({required this.title, required this.name});
}

class OfflineGalleryModule extends Module {
  final List<ImageOffline> imageList;
  OfflineGalleryModule(
      {required int id,
      required int index,
      required String title,
      required this.imageList})
      : super(id: id, index: index, title: title, type: 1) {
    offlineGalleryModuleList.add(this);
  }
  @override
  State<StatefulWidget> createState() {
    return OfflineGalleryModuleState();
  }
}

class OfflineGalleryModuleState extends State<OfflineGalleryModule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('گالری آنلاین'),
        ),
        body: StaggeredGridView.countBuilder(
          // scrollDirection: Axis.horizontal,
          crossAxisCount: 4,
          itemCount: widget.imageList.length,
          itemBuilder: (BuildContext context, int index) => new Container(
            // color: Colors.green,
            child: GestureDetector(
              child: Image.asset(
                widget.imageList[index].name,
                fit: BoxFit.cover,
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Stack(
                          overflow: Overflow.visible,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(widget.imageList[index].name),
                                Text(widget.imageList[index].title),
                              ],
                            ),
                          ],
                        ),
                      );
                    });
              },
            ),
            // child: new Center(
            //   child: new CircleAvatar(
            //     backgroundColor: Colors.white,
            //     child: new Text('${widget.imageList[index].title}'),
            //   ),
            // )
          ),
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 2 : 1),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ));
  }
}
