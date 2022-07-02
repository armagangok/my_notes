import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import '../../../core/components/global_textfield.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/extension/context_extension.dart';
import '../../../global/components/icon_container.dart';
import '../controller/color_controller.dart';
import '../controller/controller.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  MyAppBar({
    Key? key,
    required this.preferredSize,
  }) : super(key: key);

  final ColorController colorController = Get.put(ColorController());
  final HomeController controller = Get.put(HomeController());

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final height = context.getHeight(1);
    final width = context.getWidth(1);

    return AppBar(
      toolbarHeight: preferredSize.height,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(
            () {
              return controller.isSearch.value
                  ? SizedBox(
                      height: height * 0.05,
                      width: width * 0.5,
                      child: GlobalTextField(
                        hintText: "Search",
                        color: Colors.white.withOpacity(0.2),
                        // controller: controller.foodController,
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        colorController.changeColor();
                      },
                      child: const Center(
                        child: AutoSizeText(
                          "Notes",
                          minFontSize: 25,
                          maxFontSize: 30,
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: IconContanier(
            color: AppColors.grey,
            widget: IconButton(
              icon: const Icon(CupertinoIcons.search),
              onPressed: () => controller.change(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: IconContanier(
            color: AppColors.grey,
            widget: IconButton(
              icon: const Icon(CupertinoIcons.info),
              onPressed: () {},
            ),
          ),
        ),
        const SizedBox(width: 10)
      ],
    );
  }
}
