import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class VrImg extends StatelessWidget {
  Animation animateImg;
  VrImg({required this.animateImg});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: lerpDouble(-50, -300, animateImg.value),
      right: -150,
      child: Transform.rotate(
        angle: pi / -1.6,
        child: Image.asset(
          "asset/img.png",
          height: 400,
        ),
      ),
    );
  }
}
