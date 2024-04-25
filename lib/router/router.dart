import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:pulsz_app/screens/game/choose_character/choose_character_screen.dart';
import 'package:pulsz_app/screens/game/game/game_screen.dart';
import 'package:pulsz_app/screens/game/result/result_screen.dart';
import 'package:pulsz_app/screens/guides/guides_screen.dart';
import 'package:pulsz_app/screens/home/home_screen.dart';
import 'package:pulsz_app/screens/onboarding/onboarding_screen.dart';
import 'package:pulsz_app/screens/settings/settings_screen.dart';
import 'package:pulsz_app/screens/statistics/statistics_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardingRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: StatisticsRoute.page),
    AutoRoute(page: GuidesRoute.page),
    AutoRoute(page: ChooseCharacterRoute.page),
    AutoRoute(page: GameRoute.page),
    AutoRoute(page: ResultRoute.page),
  ];
}