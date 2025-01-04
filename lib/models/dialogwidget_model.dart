import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogWidgetModel {
  final String title;
  final String message;

  DialogWidgetModel(this.title, this.message);

  showDialog() {
    Get.defaultDialog(
      title: title,
      content: Text(message),
      textConfirm: 'Entendi',
      confirmTextColor: Colors.black,
      buttonColor: const Color(0xFF5CF79F),
      radius: 20,
      onConfirm: () {
        Get.back();
      },
    );
  }
}
