import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pulsz_app/router/router.dart';
import 'package:pulsz_app/screens/game/widgets/game_tile.dart';
import 'package:pulsz_app/services/shared_preferences.dart';
import 'package:pulsz_app/theme/colors.dart';
import 'package:pulsz_app/widgets/action_button_widget.dart';
import 'package:pulsz_app/widgets/custom_icon_button.dart';
import 'package:pulsz_app/widgets/dialog_container.dart';

@RoutePage()
class GameScreen extends StatefulWidget {
  final String character;

  const GameScreen({super.key, required this.character});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int heartRate = 0;
  int bluffing = 0;
  int success = 0;
  int totalGames = 0;

  int playerMove = 0;

  void startGame() {
    Random random = Random();
    heartRate = random.nextInt(171) + 60; // от 60 до 230
    bluffing = random.nextInt(101); // от 0 до 100
    success = random.nextInt(101); // от 0 до 100
    totalGames = random.nextInt(991) + 10; // от 10 до 1000

    if (heartRate < 80 && success > 94) {
      playerMove = 1;
    } else if (bluffing > 90 && heartRate < 75) {
      playerMove = 0;
    }

    playerMove = random.nextInt(3); // от 0 до 2
  }

  @override
  void initState() {
    startGame();
    print(playerMove);
    super.initState();
  }

  final List<String> characterMoves = ['bluffing', 'winning', 'losing'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.character),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconButton(
                      iconPath: 'assets/images/elements/arrow-back.svg',
                      onTap: () {
                        context.router.push(ChooseCharacterRoute());
                      },
                    ),
                    CustomIconButton(
                      iconPath: 'assets/images/elements/settings.svg',
                      onTap: () {
                        context.router.push(SettingsRoute());
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GameTile(
                            iconPath: 'assets/images/game-icons/heart.svg',
                            title: 'Heart rate',
                            value: '$heartRate',
                            onTap: () {
                              _openDialog(
                                [
                                  Text(
                                    'The player\'s heart rate is $heartRate',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24,
                                        color: AppColors.white),
                                  ),
                                  Text(
                                    heartRate < 120
                                        ? 'This means that he is calm and not worried. He probably has good cards and isn\'t bluffing'
                                        : 'This implies that he is anxious and concerned. He likely has weak cards and is likely bluffing.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: AppColors.grey),
                                  ),
                                ],
                              );
                            }),
                        GestureDetector(
                          onTap: () {
                            _openDialog([
                              Text(
                                'His favorite card suit is spade',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                    color: AppColors.white),
                              ),
                              Text(
                                'You may find this information useful :)',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.grey),
                              ),
                            ]);
                          },
                          child: DialogContainer(
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                        'assets/images/game-icons/fav-suit.svg'),
                                    SizedBox(height: 5),
                                    Text(
                                      'Favorite suit',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10),
                                SvgPicture.asset(
                                    'assets/images/game-icons/suit.svg'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _openDialog([
                              Text(
                                'The player\'s pulse is uniform',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                    color: AppColors.white),
                              ),
                              Text(
                                'Most likely he is calm and confident in himself and his victory',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.grey),
                              ),
                            ]);
                          },
                          child: DialogContainer(
                            child: SvgPicture.asset(
                                'assets/images/game-icons/rate.svg'),
                          ),
                        ),
                        GameTile(
                            iconPath: 'assets/images/game-icons/bluffing.svg',
                            title: 'Bluffing',
                            value: '$bluffing\%',
                            onTap: () {
                              _openDialog([
                                Text(
                                  'The player bluffs in $bluffing\% of games',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24,
                                      color: AppColors.white),
                                ),
                                Text(
                                  'In $bluffing\% of games this player bluffed, take note of this information',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: AppColors.grey),
                                ),
                              ]);
                            }),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GameTile(
                            iconPath: 'assets/images/game-icons/success.svg',
                            title: 'Success',
                            value: '$success\%',
                            onTap: () {
                              _openDialog([
                                Text(
                                  'Player success is $success\%',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24,
                                      color: AppColors.white),
                                ),
                                Text(
                                  'The player has won $success\% of the games he has played and is likely a good and confident player',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: AppColors.grey),
                                ),
                              ]);
                            }),
                        GameTile(
                            iconPath: 'assets/images/game-icons/total.svg',
                            title: 'Total games',
                            value: '$totalGames',
                            onTap: () {
                              _openDialog([
                                Text(
                                  'Player played $totalGames games',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24,
                                      color: AppColors.white),
                                ),
                                Text(
                                  'This player has played $totalGames games and is quite experienced',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: AppColors.grey),
                                ),
                              ]);
                            }),
                      ],
                    ),
                  ],
                ),
                DialogContainer(
                  child: Column(
                    children: [
                      Text(
                        'What does the player do?',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: AppColors.white),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          'Examine this player\'s stats and decide whether he is bluffing or not. You can click on the indicator and read the player information',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ActionButtonWidget(
                          text: 'Bluffing',
                          width: MediaQuery.of(context).size.width * 0.4,
                          onTap: () async {
                            SharedPreferencesService storage =
                                await SharedPreferencesService.getInstance();
                            storage.gamesCounter += 1;
                            if (playerMove == 0) {
                              storage.victoryCounter += 1;
                              context.router.push(ResultRoute(
                                  character: widget.character,
                                  characterMove: characterMoves[playerMove],
                                  result: 'You Win!'));
                            } else {
                              storage.lossesCounter += 1;
                              context.router.push(ResultRoute(
                                  character: widget.character,
                                  characterMove: characterMoves[playerMove],
                                  result: 'You Lose!'));
                            }
                          },
                        ),
                        ActionButtonWidget(
                          text: 'Wins',
                          width: MediaQuery.of(context).size.width * 0.4,
                          onTap: () async {
                            SharedPreferencesService storage =
                                await SharedPreferencesService.getInstance();
                            storage.gamesCounter += 1;

                            if (playerMove == 1) {
                              storage.victoryCounter += 1;
                              context.router.push(ResultRoute(
                                  character: widget.character,
                                  characterMove: characterMoves[playerMove],
                                  result: 'You Win!'));
                            } else {
                              storage.lossesCounter += 1;
                              context.router.push(ResultRoute(
                                  character: widget.character,
                                  characterMove: characterMoves[playerMove],
                                  result: 'You Lose!'));
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ActionButtonWidget(
                          text: 'Loses',
                          width: MediaQuery.of(context).size.width * 0.4,
                          onTap: () async {
                            SharedPreferencesService storage =
                                await SharedPreferencesService.getInstance();
                            storage.gamesCounter += 1;

                            if (playerMove == 2) {
                              storage.victoryCounter += 1;
                              context.router.push(ResultRoute(
                                  character: widget.character,
                                  characterMove: characterMoves[playerMove],
                                  result: 'You Win!'));
                            } else {
                              storage.lossesCounter += 1;
                              context.router.push(ResultRoute(
                                  character: widget.character,
                                  characterMove: characterMoves[playerMove],
                                  result: 'You Lose!'));
                            }
                          },
                        ),
                        ActionButtonWidget(
                          text: 'I don’t know',
                          width: MediaQuery.of(context).size.width * 0.4,
                          onTap: () {
                            context.router.push(ChooseCharacterRoute());
                          },
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openDialog(List<Widget> children) {
    showDialog(
      context: context,
      builder: (BuildContext context) => Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.9,
          child: DialogContainer(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: children,
          )),
        ),
      ),
    );
  }
}
