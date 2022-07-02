import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:my_notes/global/controllers/text_controllers.dart';

import '../../core/constants/app_colors.dart';
import '../../core/extension/context_extension.dart';
import '../../global/components/icon_container.dart';
import '../../global/components/text_field.dart';
import '../home/home_page.dart';

class TakeNotePage extends StatelessWidget {
  const TakeNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TakeNoteTextController controller = Get.put(TakeNoteTextController());
    return GestureDetector(
      onTap: () => context.dismissKeyboard(),
      child: Scaffold(
        appBar: buildAppBar(
          context.getHeight(1),
          context.getWidth(1),
          controller,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: context.getWidth(0.07)),
          children: [
            TitleTextField(
              controller: controller.titleController,
            ),
            SizedBox(height: context.getHeight(0.025)),
            ContentTextField(
              controller: controller.contentController,
            ),
          ],
        ),
      ),
    );
  }

  //
  AppBar buildAppBar(height, width, controller) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: height * 0.12,
      leading: IconContanier(
        widget: IconButton(
          onPressed: () => checkDialog(height, width, controller),
          icon: const Icon(CupertinoIcons.back),
        ),
        color: AppColors.grey,
      ),
      actions: [
        IconContanier(
          color: AppColors.grey,
          widget: IconButton(
            icon: const Icon(CupertinoIcons.check_mark),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  //
  void checkDialog(height, width, TakeNoteTextController controller) {
    (controller.titleController.text.isNotEmpty ||
            controller.contentController.text.isNotEmpty)
        ? Get.dialog(
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Dialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                backgroundColor: const Color(0xff252525),
                child: Padding(
                  padding: EdgeInsets.all(width * 0.045),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        CupertinoIcons.info_circle_fill,
                        color: Color(0xff606060),
                      ),
                      SizedBox(height: height * 0.022),
                      const AutoSizeText(
                        "Are your sure you want discard your changes ?",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: height * 0.022),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * 0.25,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.dialogRed,
                              ),
                              onPressed: () {
                                Get.to(const HomePage());
                                Get.delete<TakeNoteTextController>();
                              },
                              child: const AutoSizeText(
                                "Discard",
                                maxLines: 1,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.25,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: AppColors.dialogGreen),
                              onPressed: () => Get.back(),
                              child: const AutoSizeText(
                                "Keep",
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : Get.back();
  }
}
