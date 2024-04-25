import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pulsz_app/router/router.dart';
import 'package:pulsz_app/theme/colors.dart';
import 'package:pulsz_app/widgets/action_button_widget.dart';
import 'package:pulsz_app/widgets/custom_icon_button.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Poker Pulsz',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 34,
                        color: AppColors.white),
                  ),
                  CustomIconButton(
                      iconPath: 'assets/images/elements/settings.svg',
                      onTap: () {
                        context.router.push(SettingsRoute());
                      }),
                ],
              ),
            ),
            Column(
              children: [
                Image.asset('assets/images/home/image.png'),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    'Check your intuition',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        color: AppColors.white),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Text(
                    'See if you can guess the player\'s action based on his indicators!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: AppColors.grey),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ActionButtonWidget(text: 'New Game', width: double.infinity, onTap: () {
                    context.router.push(ChooseCharacterRoute());

                  }),
                  SizedBox(height: 15),
                  ActionButtonWidget(text: 'Guides', width: double.infinity, onTap: () {
                    context.router.push(GuidesRoute());
                  }),
                  SizedBox(height: 15),
                  ActionButtonWidget(text: 'Statistics', width: double.infinity, onTap: () {
                    context.router.push(StatisticsRoute());
                  }),
                ],
              ),
            ),
            SizedBox(height: 1),
          ],
        ),
      ),
    );
  }
}
