import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:my_notes/global/model/note_model.dart';

import '../../core/constants/app_colors.dart';
import '../../core/extension/context_extension.dart';
import '../../global/components/icon_container.dart';

class NoteDetailPage extends StatelessWidget {
  const NoteDetailPage({
    Key? key,
    required this.note,
  }) : super(key: key);

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    final height = context.getHeight(1);
    final width = context.getWidth(1);
    return Scaffold(
      appBar: buildAppBar(height, width),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: context.getWidth(0.07)),
        children: [
          SizedBox(height: height * 0.025),
          AutoSizeText(
            note.title!,
            style: context.textTheme.headline5!.copyWith(
              height: 1.3,
            ),
          ),
          SizedBox(height: height * 0.025),
          AutoSizeText(
            note.content!,
            style: context.textTheme.bodyText1!.copyWith(
              fontSize: 14,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }

  //

  AppBar buildAppBar(double height, double width) {
    return AppBar(
      toolbarHeight: height * 0.12,
      automaticallyImplyLeading: false,
      leading: IconContanier(
        widget: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(CupertinoIcons.back),
        ),
        color: AppColors.grey,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: IconContanier(
            color: AppColors.grey,
            widget: IconButton(
              icon: const Icon(CupertinoIcons.share),
              onPressed: () {},
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: IconContanier(
            color: AppColors.grey,
            widget: IconButton(
              icon: const Icon(CupertinoIcons.pencil),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
