import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vr/vr.dart';

class VrCalendar extends StatelessWidget {
  List days;
  double value;
  Size size;
  VrCalendar({required this.days, required this.value, required this.size});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: lerpDouble(size.height / 2, size.height / 3.5, value),
        left: lerpDouble(0, 20, value),
        right: lerpDouble(0, 20, value),
        child: Container(
          height: lerpDouble(200, 80, value),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 46, 212),
            borderRadius: BorderRadius.circular(lerpDouble(0, 10, value)!),
          ),
          child: ListView.builder(
              itemCount: days.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final day = days[index];
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          day,
                          style: TextStyle(
                            color: index == 0
                                ? Colors.white.withOpacity(.9)
                                : Color.fromARGB(255, 56, 91, 219),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (index == 0) ...{
                          const SizedBox(
                            height: 6,
                          ),
                          Container(
                            height: 2,
                            width: 10,
                            margin: const EdgeInsets.only(left: 2.0),
                            color: Colors.white,
                          )
                        } else
                          const SizedBox(
                            height: 6,
                          ),
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
