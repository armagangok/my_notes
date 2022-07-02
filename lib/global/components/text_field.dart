import 'package:flutter/material.dart';

import '../../core/extension/context_extension.dart';

class TitleTextField extends StatelessWidget {
  final TextEditingController controller;

  const TitleTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollPadding: EdgeInsets.zero,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        border: InputBorder.none,
        hintText: "Title",
        hintStyle: context.textTheme.headline5!.copyWith(),
      ),
      cursorColor: Colors.grey,
      style: context.textTheme.headline5,
      maxLines: null,
      controller: controller,
    );
  }
}

class ContentTextField extends StatelessWidget {
  const ContentTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollPadding: EdgeInsets.zero,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        border: InputBorder.none,
        hintText: "Type something...",
        hintStyle: context.textTheme.bodyText1!.copyWith(fontSize: 14),
      ),
      cursorColor: Colors.grey,
      style: context.textTheme.bodyText1!.copyWith(fontSize: 14,height: 1.3),
      maxLines: null,
      controller: controller,
    );
  }
}
