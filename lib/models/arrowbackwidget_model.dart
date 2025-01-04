import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArrowBackWidgetModel extends StatelessWidget {
  const ArrowBackWidgetModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
      ),
    );
  }
}
