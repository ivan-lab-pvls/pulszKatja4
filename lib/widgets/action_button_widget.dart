import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:pulsz_app/theme/colors.dart';

class ActionButtonWidget extends StatelessWidget {
  final String text;
  final double width;
  final void Function()? onTap;

  const ActionButtonWidget(
      {super.key,
      required this.text,
      required this.width,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color(0xFF152E40),
                  const Color(0xFF27243C),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
            border: GradientBoxBorder(
              gradient: LinearGradient(
                colors: [
                  Color(0x80FEFEFE),
                  Color(0x00FEFEFE),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              width: 1.5,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
