import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:appbesaz/modules/module.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

List<OnlineGalleryModule> onlineGalleryModuleList = [];
OnlineGalleryModule? findOnlineGalleryModuleById(int id) {
  for (OnlineGalleryModule a in onlineGalleryModuleList) {
    if (a.id == id) return a;
  }
}

class ImageAB {
  final String title;
  final String link;
  ImageAB({required this.title, required this.link});
}

class OnlineGalleryModule extends Module {
  final List<ImageAB> imageList;

  OnlineGalleryModule(
      {required int id,
      required int index,
      required String title,
      required this.imageList})
      : super(id: id, index: index, title: title, type: 1) {
    onlineGalleryModuleList.add(this);
  }
  @override
  State<StatefulWidget> createState() {
    return OnlineGalleryModuleState();
  }
}

class OnlineGalleryModuleState extends State<OnlineGalleryModule> {
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
                                CachedNetworkImage(
                                    imageUrl: widget.imageList[index].link),
                                Text(widget.imageList[index].title),
                              ],
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: CachedNetworkImage(
                imageUrl: widget.imageList[index].link,
                // height: 50,
                fit: BoxFit.cover,
                // width: 50,
              ),
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
