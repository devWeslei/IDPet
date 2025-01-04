import 'package:flutter/material.dart';

class BackgroundWidgetModel extends StatelessWidget {
  final BoxConstraints constraints;

  const BackgroundWidgetModel({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -110,
      left: constraints.maxWidth <= 600
          ? (constraints.maxWidth / 2) - (455 / 2)
          : (600 / 2) - (455 / 2),
      child: Transform.scale(
        scale: 1.3,
        child: ClipOval(
          child: Container(
            color: const Color(0xFFF2ACE1),
            width: 455,
            height: 314,
          ),
        ),
      ),
    );
  }
}
