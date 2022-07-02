import 'package:get/state_manager.dart';

class EditController extends GetxController {
  RxBool isEditView = RxBool(false);

  changeEditView() => isEditView.value = !isEditView.value;
}
