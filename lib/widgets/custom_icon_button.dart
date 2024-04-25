import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class CustomIconButton extends StatelessWidget {
  final String iconPath;
  final void Function()? onTap;

  const CustomIconButton(
      {super.key, required this.iconPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
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
                Color(0x80E317AA),
                Color(0x800084CE),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            width: 1.5,
          ),
        ),
        child: SvgPicture.asset(iconPath),
      ),
    );
  }
}
