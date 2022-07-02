import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ColorController extends GetxController {
  RxList<Color> colors = RxList([
    const Color(0xffFD99FF),
    const Color(0xffFF9E9E),
    const Color(0xff91F48F),
    const Color.fromARGB(255, 110, 199, 255),
    const Color(0xffFFF599),
    const Color(0xff9EFFFF),
    const Color.fromARGB(255, 117, 255, 255),
    const Color.fromARGB(255, 255, 128, 128),
    const Color.fromARGB(255, 208, 208, 208),
    const Color.fromARGB(255, 255, 255, 255),
  ]);

  RxBool pressed = RxBool(false);

  void changeColor() {
    colors.shuffle();
    pressed.value = !pressed.value;
    notifyChildrens();
  }
}
