import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vr/vr_button_grid_bloc.dart';
import 'package:vr/vr_calendar.dart';
import 'package:vr/vr_img.dart';
import 'package:vr/vr_text.dart';

const Color primaryColor = Color.fromARGB(255, 0, 64, 117);

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _animatedController;
  late Animation _animateImg;
  late Animation _animateVrText;
  late ScrollController scrollController;
  List days = [
    "Today",
    "Fri,18",
    "Sat,19",
    "Sun,20",
    "Mon,21",
    "Tue,22",
    "Wed,23",
    "Thu,24",
    "Fri,25",
  ];
  @override
  void initState() {
    super.initState();

    _animatedController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    scrollController = ScrollController(
      initialScrollOffset: 3,
    );

    _animateVrText = CurvedAnimation(
        parent: _animatedController,
        curve: const Interval(
          0.3,
          1.0,
        ));
    _animateImg = CurvedAnimation(
        parent: _animatedController,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.fastOutSlowIn,
        ));
    _animatedController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        scrollController.jumpTo(1.0);
      }
    });
  }

  Offset vrCardPosition = Offset(0, 0);
  @override
  void dispose() {
    super.dispose();
    _animatedController.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: AnimatedBuilder(
          animation: _animatedController,
          builder: (context, _) {
            final value = Curves.easeInOut.transform(_animatedController.value);
            return Stack(
              children: [
                // Accueil container----------------------------------------------------------------
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height:
                        lerpDouble(size.height / 1.9, size.height / 3, value),
                    width: double.infinity,
                    color: Colors.brown.shade100,
                    child: Stack(
                      children: const [
                        Positioned(
                          top: 60,
                          left: 30,
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: primaryColor,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
// Titre à l'accueil ---------------------
                VrText(animateVrText: _animateVrText),
// Image à l'accueil --------------------
                VrImg(animateImg: _animateImg),
// la liste de la date ----------------------------------------------------------------
                VrCalendar(days: days, value: value, size: size),

                Positioned(
                  top: lerpDouble(size.height / 1.8, 56, value),
                  left: lerpDouble(18, 60, value),
                  child: Text(
                    "December",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: value > .2
                          ? primaryColor
                          : Colors.white.withOpacity(.9),
                      fontSize: 20,
                    ),
                  ),
                ),
// calendrié liste Grid view----------------------------------------------------------------
                VrButtonCardBloc(
                  size: size,
                  value: value,
                  onPointerHover: (event) {
                    setState(() {
                      vrCardPosition = event.localPosition;
                    });
                  },
                  onPointerMove: (event) {
                    final pointerY = event.localDelta.dy;

                    if (pointerY < -2.0) {
                      _animatedController.forward();
                    }
                    scrollController.addListener(() {
                      if (scrollController.offset < 1) {
                        _animatedController.reverse();
                      }
                    });
                  },
                  vrCardPosition: vrCardPosition,
                  scrollController: scrollController,
                ),

                // Calendrier au dessus de la liste de date
                if (value > .96)
                  // la liste de la date ----------------------------------------------------------------
                  VrCalendar(days: days, value: value, size: size),
              ],
            );
          }),
    );
  }
}
