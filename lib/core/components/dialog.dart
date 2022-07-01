import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:my_notes/page/home/home_page.dart';

import '../../core/extension/context_extension.dart';
import '../constants/app_colors.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getWidth(0.75),
      height: context.getHeight(0.2),
      // color: AppColors.dialogColor,
      child: Padding(
        padding: EdgeInsets.all(context.getWidth(0.03)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              CupertinoIcons.info_circle_fill,
              color: Colors.white,
            ),
            const AutoSizeText(
              "Are your sure you want discard your changes ?",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: AppColors.dialogRed),
                  onPressed: () => Get.to(const HomePage()),
                  child: const Text("Discard"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: AppColors.dialogGreen),
                  onPressed: () => Get.back(),
                  child: const Text("Keep"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
