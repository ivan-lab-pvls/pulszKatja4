// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ChooseCharacterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChooseCharacterScreen(),
      );
    },
    GameRoute.name: (routeData) {
      final args = routeData.argsAs<GameRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GameScreen(
          key: args.key,
          character: args.character,
        ),
      );
    },
    GuidesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GuidesScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    ResultRoute.name: (routeData) {
      final args = routeData.argsAs<ResultRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResultScreen(
          key: args.key,
          character: args.character,
          characterMove: args.characterMove,
          result: args.result,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    StatisticsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StatisticsScreen(),
      );
    },
  };
}

/// generated route for
/// [ChooseCharacterScreen]
class ChooseCharacterRoute extends PageRouteInfo<void> {
  const ChooseCharacterRoute({List<PageRouteInfo>? children})
      : super(
          ChooseCharacterRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseCharacterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GameScreen]
class GameRoute extends PageRouteInfo<GameRouteArgs> {
  GameRoute({
    Key? key,
    required String character,
    List<PageRouteInfo>? children,
  }) : super(
          GameRoute.name,
          args: GameRouteArgs(
            key: key,
            character: character,
          ),
          initialChildren: children,
        );

  static const String name = 'GameRoute';

  static const PageInfo<GameRouteArgs> page = PageInfo<GameRouteArgs>(name);
}

class GameRouteArgs {
  const GameRouteArgs({
    this.key,
    required this.character,
  });

  final Key? key;

  final String character;

  @override
  String toString() {
    return 'GameRouteArgs{key: $key, character: $character}';
  }
}

/// generated route for
/// [GuidesScreen]
class GuidesRoute extends PageRouteInfo<void> {
  const GuidesRoute({List<PageRouteInfo>? children})
      : super(
          GuidesRoute.name,
          initialChildren: children,
        );

  static const String name = 'GuidesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResultScreen]
class ResultRoute extends PageRouteInfo<ResultRouteArgs> {
  ResultRoute({
    Key? key,
    required String character,
    required String characterMove,
    required String result,
    List<PageRouteInfo>? children,
  }) : super(
          ResultRoute.name,
          args: ResultRouteArgs(
            key: key,
            character: character,
            characterMove: characterMove,
            result: result,
          ),
          initialChildren: children,
        );

  static const String name = 'ResultRoute';

  static const PageInfo<ResultRouteArgs> page = PageInfo<ResultRouteArgs>(name);
}

class ResultRouteArgs {
  const ResultRouteArgs({
    this.key,
    required this.character,
    required this.characterMove,
    required this.result,
  });

  final Key? key;

  final String character;

  final String characterMove;

  final String result;

  @override
  String toString() {
    return 'ResultRouteArgs{key: $key, character: $character, characterMove: $characterMove, result: $result}';
  }
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StatisticsScreen]
class StatisticsRoute extends PageRouteInfo<void> {
  const StatisticsRoute({List<PageRouteInfo>? children})
      : super(
          StatisticsRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatisticsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
