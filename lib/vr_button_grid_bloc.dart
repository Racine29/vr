import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vr/vr.dart';
import 'package:vr/vr_card.dart';

class VrButtonCardBloc extends StatelessWidget {
  Size size;
  double value;
  Function(PointerMoveEvent)? onPointerMove;
  Function(PointerHoverEvent)? onPointerHover;
  Offset vrCardPosition;
  ScrollController scrollController;
  VrButtonCardBloc({
    required this.size,
    required this.value,
    required this.onPointerMove,
    required this.onPointerHover,
    required this.vrCardPosition,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: lerpDouble(size.height / 1.4, size.height / 2.62, value),
      left: lerpDouble(10, 0, value),
      right: lerpDouble(10, 0, value),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(lerpDouble(10, 0, value)!),
        child: Container(
          height: lerpDouble(300, size.height / 1.6, value),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(lerpDouble(10, 0, value)!),
          ),
          child: Listener(
            onPointerMove: onPointerMove,
            onPointerHover: onPointerHover,
            child: GridView.builder(
                itemCount: calendars.length,
                padding: EdgeInsets.zero,
                physics:
                    value > .9 ? null : const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                ),
                controller: scrollController,
                itemBuilder: (ctx, index) {
                  final vr = calendars[index];

                  return VrCard(
                    vr: vr,
                    cardPosition: vrCardPosition,
                    hero: "card-$index",
                  );
                }),
          ),
        ),
      ),
    );
  }
}
