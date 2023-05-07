import 'package:flutter/material.dart';
import 'package:vr/vr.dart';

import 'vr_detail.dart';

class VrCard extends StatelessWidget {
  Vr vr;
  String hero;
  Offset cardPosition;
  VrCard({required this.vr, required this.hero, required this.cardPosition});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: hero,
      child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(PageRouteBuilder(
                opaque: false,
                pageBuilder: (_, anim, __) {
                  return FadeTransition(
                    opacity: anim,
                    child: VrDetail(
                      vr: vr,
                      hero: hero,
                      cardPosition: cardPosition,
                    ),
                  );
                }));
          },
          child: card(
            vr: vr,
          )),
    );
  }
}

class card extends StatelessWidget {
  Vr vr;
  card({required this.vr});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade300,
          width: .5,
        ),
      ),
      child: Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              vr.time,
              style: const TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 70, 91, 109),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "\$${vr.price}",
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 94, 99, 104),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Per person",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
