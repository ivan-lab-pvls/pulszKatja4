import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final Widget child;

  const AppContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
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
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: child,
    );
  }
}
