import 'package:get/get.dart';

class TermsAndConditions extends GetxController {
RxBool isChecked = false.obs;

void toggleCheckbox() {
isChecked.value = !isChecked.value;
}
}