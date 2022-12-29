import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/gallery_controller.dart';
import '../gridview_static.dart';
import '/models/gallery_album.dart';
import 'media_view.dart';

class DateCategoryWiew extends StatelessWidget {
  PhoneGalleryController controller;
  bool singleMedia;
  DateCategoryWiew(
      {super.key,
      required this.category,
      required this.controller,
      required this.singleMedia});
  DateCategory category;

  int getRowCount() {
    if (category.files.length % 4 != 0) {
      return category.files.length ~/ 4 + 1;
    } else {
      return category.files.length ~/ 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  category.name,
                  style: controller.config.textStyle,
                ),
              ),
            ),
            GridViewStatic(
              size: MediaQuery.of(context).size.width,
              padding: EdgeInsets.zero,
              crossAxisCount: 4,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              children: <Widget>[
                ...category.files.map(
                  (medium) => MediaView(
                    medium,
                    controller: controller,
                    singleMedia: singleMedia,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}