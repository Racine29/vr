import 'package:flutter/material.dart';
import 'package:vr/vr.dart';
import 'package:vr/vr_card.dart';

class VrDetail extends StatelessWidget {
  Vr vr;
  String hero;
  Offset cardPosition;
  VrDetail({required this.vr, required this.hero, required this.cardPosition});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned(
            top: cardPosition.dy + 150,
            left: cardPosition.dx / 3.5,
            child: Container(
              child: Hero(
                tag: hero,
                child: card(
                  vr: vr,
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 50,
              right: 40,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
