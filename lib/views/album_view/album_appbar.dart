import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gallery_picker/models/gallery_album.dart';
import 'package:get/get.dart';
import '../../controller/bottom_sheet_controller.dart';
import '../../controller/gallery_controller.dart';
import '../gallery_picker_view/tappable_appbar.dart';

class AlbumAppBar extends StatelessWidget with PreferredSizeWidget {
  PhoneGalleryController controller;
  BottomSheetController? bottomSheetController;
  GalleryAlbum album;
  AlbumAppBar(
      {super.key,
      required this.bottomSheetController,
      required this.album,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    print("zort");
    return TappableAppbar(
      controller: bottomSheetController,
      child: AppBar(
        elevation: 0,
        foregroundColor: controller.config.appbarIconColor,
        backgroundColor: controller.config.appbarColor,
        leading: TextButton(
            onPressed: () {
              controller.changeAlbum(null);
            },
            child: Icon(
              Icons.arrow_back,
              color: controller.config.appbarIconColor,
            )),
        title: getTitle(),
        actions: [
          !controller.pickerMode
              ? TextButton(
                  onPressed: () {
                    controller.switchPickerMode(true);
                  },
                  child: Icon(
                    Icons.check_box_outlined,
                    color: controller.config.appbarIconColor,
                  ))
              : const SizedBox()
        ],
      ),
    );
  }

  Widget getTitle() {
    if (!controller.pickerMode && controller.selectedFiles.isEmpty) {
      return Text(
        album.album.name!,
        style: controller.config.appbarTextStyle,
      );
    } else if (controller.pickerMode && controller.selectedFiles.isEmpty) {
      return Text(
        controller.config.tapPhotoSelect,
        style: controller.config.appbarTextStyle,
      );
    } else if (controller.pickerMode && controller.selectedFiles.isNotEmpty) {
      return Text(
        "${controller.selectedFiles.length} ${controller.config.selected}",
        style: controller.config.appbarTextStyle,
      );
    } else {
      return const SizedBox();
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(48);
}
