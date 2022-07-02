import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

import '../../core/constants/app_colors.dart';
import '../../core/extension/context_extension.dart';
import '../../global/components/icon_container.dart';
import '../../global/components/text_field.dart';
import '../../global/controllers/text_controllers.dart';
import '../../global/model/note_model.dart';
import 'controllers/edit_controller.dart';

class NoteDetailPage extends StatelessWidget {
  const NoteDetailPage({
    Key? key,
    required this.note,
  }) : super(key: key);

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    final EditTextController editTextController = Get.put(EditTextController());
    final EditController editController = Get.put(EditController());

    final height = context.getHeight(1);
    final width = context.getWidth(1);

    return GestureDetector(
      onTap: () => context.dismissKeyboard(),
      child: Scaffold(
        appBar: buildAppBar(height, width, editController, context.textTheme),
        body: ListView(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: context.getWidth(0.07)),
          children: [
            SizedBox(height: height * 0.025),
            Obx(
              () {
                editTextController.editTitleController.text = note.title!;
                return editController.isEditView.value
                    ? TitleTextField(
                        controller: editTextController.editTitleController,
                      )
                    : AutoSizeText(
                        note.title!,
                        style: context.textTheme.headline5!.copyWith(),
                      );
              },
            ),
            SizedBox(height: height * 0.025),
            Obx(
              () {
                editTextController.editContentController.text = note.content!;
                return editController.isEditView.value
                    ? ContentTextField(
                        controller: editTextController.editContentController,
                      )
                    : AutoSizeText(
                        note.content!,
                        style: context.textTheme.bodyText1!.copyWith(
                          fontSize: 14,
                          height: 1.3,
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }

  //

  AppBar buildAppBar(
    double height,
    double width,
    EditController editController,
    TextTheme textTheme,
  ) {
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
              onPressed: () {
                editController.changeEditView();
                editController.isEditView.value
                    ? Get.snackbar(
                        "Hello",
                        "Hellooo",
                        margin: const EdgeInsets.all(10),
                        snackPosition: SnackPosition.BOTTOM,
                        messageText: Center(
                          child: AutoSizeText(
                            "Tap on text to edit your content!",
                            style: textTheme.bodyText1,
                          ),
                        ),
                      )
                    : {};
              },
            ),
          ),
        ),
      ],
    );
  }
}
