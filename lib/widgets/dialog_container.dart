import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class DialogContainer extends StatelessWidget {
  final Widget child;

  const DialogContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              const Color(0x33FF7BDA),
              const Color(0x336FA9FF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        border: GradientBoxBorder(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFFFFF),
              Color(0x00FFFFFF),
              Color(0xFFFFFFFF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          width: 1.5,
        ),
      ),
      child: BlurryContainer(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: child,
      ),
    );
  }
}
