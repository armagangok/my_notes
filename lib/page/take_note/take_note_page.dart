import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

import '../../core/constants/app_colors.dart';
import '../../core/extension/context_extension.dart';
import '../../global/components/icon_container.dart';
import '../home/controller/text_controller.dart';
import '../home/home_page.dart';

class TakeNotePage extends StatelessWidget {
  TakeNotePage({Key? key}) : super(key: key);

  final TextController _controller = Get.put(TextController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.dismissKeyboard(),
      child: Scaffold(
        appBar: buildAppBar(context.getHeight(1), context.getWidth(1)),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: context.getWidth(0.07)),
          children: [
            titleTextField(context),
            contentTextField(context),
          ],
        ),
      ),
    );
  }

  //

  TextFormField contentTextField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Type something...",
        hintStyle: context.textTheme.bodyText1!.copyWith(fontSize: 14),
      ),
      cursorColor: Colors.grey,
      style: context.textTheme.bodyText1!.copyWith(fontSize: 14),
      maxLines: null,
      controller: _controller.contentController,
    );
  }

  //

  TextFormField titleTextField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Title",
        hintStyle: context.textTheme.headline5!.copyWith(),
      ),
      cursorColor: Colors.grey,
      style: context.textTheme.headline5,
      maxLines: null,
      controller: _controller.titleController,
    );
  }

  //

  AppBar buildAppBar(height, width) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: height * 0.12,
      leading: IconContanier(
        widget: IconButton(
          onPressed: () => checkDialog(height, width),
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

  void checkDialog(height, width) {
    (_controller.titleController.text.isNotEmpty ||
            _controller.contentController.text.isNotEmpty)
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
                              onPressed: () => Get.to(const HomePage()),
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
