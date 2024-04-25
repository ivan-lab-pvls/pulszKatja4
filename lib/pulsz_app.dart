import 'package:flutter/material.dart';
import 'package:pulsz_app/router/router.dart';

class PulszApp extends StatelessWidget {
  PulszApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'SF Pro Display'),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
