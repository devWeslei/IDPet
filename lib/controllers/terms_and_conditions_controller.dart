import 'package:get/get.dart';

class TermsAndConditionsController extends GetxController {
  RxBool isChecked = false.obs;

  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }
}
