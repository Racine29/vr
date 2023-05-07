import 'dart:ui';

import 'package:flutter/material.dart';

import 'home.dart';

class VrText extends StatelessWidget {
  Animation animateVrText;
  VrText({required this.animateVrText});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: lerpDouble(140, -400, animateVrText.value),
      left: 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "VR-\nCITY R",
            style: TextStyle(
              color: primaryColor,
              fontSize: 60,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                Icons.star,
                color: primaryColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "4.8",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
