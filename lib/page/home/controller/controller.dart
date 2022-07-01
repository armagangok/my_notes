import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  RxBool isSearch = RxBool(false);

  void change() => isSearch.value = !isSearch.value;
}


