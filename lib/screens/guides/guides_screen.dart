import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pulsz_app/router/router.dart';
import 'package:pulsz_app/screens/guides/widgets/guide_tile.dart';
import 'package:pulsz_app/theme/colors.dart';
import 'package:pulsz_app/widgets/app_container.dart';
import 'package:pulsz_app/widgets/custom_icon_button.dart';

@RoutePage()
class GuidesScreen extends StatefulWidget {
  const GuidesScreen({super.key});

  @override
  State<GuidesScreen> createState() => _GuidesScreenState();
}

class _GuidesScreenState extends State<GuidesScreen> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      appBar: AppBar(
        backgroundColor: AppColors.bgDark,
        leadingWidth: 110,
        leading: Row(
          children: [
            SizedBox(width: 16),
            CustomIconButton(
              iconPath: 'assets/images/elements/arrow-back.svg',
              onTap: () {
                context.router.push(HomeRoute());
              },
            ),
          ],
        ),
        actions: [
          CustomIconButton(
            iconPath: 'assets/images/elements/settings.svg',
            onTap: () {
              context.router.push(SettingsRoute());
            },
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Guides',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 34,
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(height: 15),
              GuideTile(
                  topic: 'Secrets of poker psychology',
                  question:
                      'How to recognise your opponent\'s bluff by his behaviour and pulse rate?',
                  titleFirst: 'Behavioral Analysis: ',
                  textFirst:
                      'Reading your opponent\'s body signals and facial expressions can be your best weapon at the poker table. Pay attention to the smallest gestures, changes in facial expressions and reactions to different events in the game.',
                  titleSecond: 'Observe your heart rate: ',
                  textSecond: 'Heart rate is one of the most reliable physiological indicators of human arousal. It can give away an opponent who is trying to hide his nervousness or emotional tension. Learn to observe changes in your opponent\'s heart rate and analyze them in the context of the current game situation.',
                  titleThird: 'Combining Observations: ',
                  textThird: 'A key advantage is the ability to combine different signs of bluffing, such as behavior and heart rate, to draw more accurate conclusions. For example, if you notice that your opponent starts to shake and his heart rate increases after he has made a big bet, this could be a sign that he is bluffing.'),
              SizedBox(height: 15),
              GuideTile(
                  topic: 'Heart rate monitoring techniques',
                  question:
                  'how to use heart rate changes to determine your opponent\'s true intentions at the poker table',
                  titleFirst: 'Observing your baseline heart rate: ',
                  textFirst: 'Start by studying your opponent\'s baseline heart rate in different game situations. This will help you determine his normal readings and notice any changes that may indicate agitation or stress.',
                  titleSecond: 'Matching Events and Reactions: ',
                  textSecond: 'Pay attention to changes in heart rate in response to certain events in the game, such as bets made, revealing common cards, or reactions of other players. This will give you a better understanding of what actions are causing your opponent stress or excitement.',
                  titleThird: 'Evaluate consistency: ',
                  textThird: 'Compare heartbeat changes with other signs of stress or bluffing, such as facial expressions or gestures. If you notice that your opponent\'s heartbeat increases at times when he is betting big or showing weakness, this may indicate that he is bluffing.'),
              SizedBox(height: 15),
              GuideTile(
                  topic: 'Bluff or Truth',
                  question:
                  'Learn to read between the lines by analysing your heart rate while playing poker',
                  titleFirst: 'Bluffing Physiology: ',
                  textFirst: 'Studies show that a person\'s heart rate can increase during moments of stress or excitement, which can be associated with attempting to bluff at the poker table. With this in mind, monitoring your opponent\'s heart rate can give you more information about their true intentions.',
                  titleSecond: 'Heart rate changes: ',
                  textSecond: 'Pay attention to changes in your opponent\'s heart rate in different situations of the game. For example, a rapid heartbeat after a bet is made or common cards are revealed may indicate nervousness or stress, which could be related to bluffing.',
                  titleThird: 'Comparison with other signs of bluffing: ',
                  textThird: 'Compare changes in heart rate with other signs of bluffing, such as facial expressions, behavior and reactions of your opponent. If you notice a coincidence between an increase in heart rate and other signs of stress, it could be a signal of a bluff.'),
              SizedBox(height: 15),
              GuideTile(
                  topic: 'Practical tips from professionals',
                  question:
                  'How to train your eye and recognize the pulse of a bluffing opponent',
                  titleFirst: 'In-depth observation: ',
                  textFirst: 'One of the main tools for spotting a bluff is to observe your opponent\'s behavior in depth. Pay attention to facial expressions, gestures, changes in voice and other signs of nervousness or stress that may indicate a bluff.',
                  titleSecond: 'Practice in offline games: ',
                  textSecond: 'Try practicing your observation skills in offline games or in home poker sessions with friends. This will help you learn to read your opponents\' behavior and reactions without the pressure of real betting.',
                  titleThird: 'Comparison to normal rates: ',
                  textThird: 'Compare your opponent\'s heart rate to their normal rates. If you notice an increase in heart rate at times of stress or important decisions, it could be a sign of his bluffing.'),
            ],
          ),
        ),
      ),
    );
  }
}
