import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

import './controller/color_controller.dart';
import './controller/controller.dart';
import '../../core/components/global_textfield.dart';
import '../../core/constants/app_colors.dart';
import '../../core/extension/context_extension.dart';
import '../../global/components/icon_container.dart';
import '../../global/data/dummy_data.dart';
import '../note_detail/note_detail_page.dart';
import '../take_note/take_note_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.getHeight(1);
    final width = context.getWidth(1);

    HomeController controller = Get.put(HomeController());
    ColorController colorController = Get.put(ColorController());

    return GestureDetector(
      onTap: () => context.dismissKeyboard(),
      child: Scaffold(
        appBar: buildAppBar(height, width, controller, colorController),
        body: ListView.separated(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Get.to(
                NoteDetailPage(note: notes[index]),
              ),
              child: buildItem(
                width,
                index,
                colorController,
                context.textTheme,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: height * 0.028);
          },
          itemCount: notes.length,
        ),
        floatingActionButton: buildFloatingButton(
          height,
          width,
        ),
      ),
    );
  }

  //

  Widget buildFloatingButton(
    double heigth,
    double width,
  ) {
    return FloatingActionButton(
      onPressed: () => Get.to(const TakeNotePage()),
      backgroundColor: Colors.transparent,
      child: IconContanier(
        height: heigth * 0.07,
        width: heigth * 0.07,
        widget: const Icon(
          CupertinoIcons.add,
          color: Colors.white,
        ),
        color: Colors.black.withOpacity(0.35),
      ),
    );
  }

  //

  Widget buildItem(double width, int index, ColorController colorController,
      TextTheme textTheme) {
    return Obx(
      () => IconContanier(
        color: colorController.colors[Random().nextInt(9)],
        width: double.infinity,
        widget: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.1,
            vertical: width * 0.06,
          ),
          child: AutoSizeText(
            notes[index].title!,
            minFontSize: 18,
            style: textTheme.headline6!.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

//

AppBar buildAppBar(
  double heigth,
  double width,
  HomeController controller,
  ColorController colorController,
) {
  return AppBar(
    toolbarHeight: heigth * 0.12,
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Obx(() {
          return controller.isSearch.value
              ? SizedBox(
                  height: heigth * 0.05,
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
                  child: const AutoSizeText(
                    "Notes",
                    minFontSize: 40,
                  ),
                );
        }),
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
