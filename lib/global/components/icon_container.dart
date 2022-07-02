import 'package:flutter/material.dart';

class IconContanier extends StatelessWidget {
  const IconContanier({
    Key? key,
    required this.widget,
    this.width,
    this.height,
    required this.color,
  }) : super(key: key);

  final Widget widget;
  final double? width;
  final double? height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: widget,
      ),
    );
  }
}
