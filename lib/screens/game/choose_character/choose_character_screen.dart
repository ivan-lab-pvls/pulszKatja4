import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:pulsz_app/router/router.dart';
import 'package:pulsz_app/theme/colors.dart';
import 'package:pulsz_app/widgets/action_button_widget.dart';
import 'package:pulsz_app/widgets/custom_icon_button.dart';

@RoutePage()
class ChooseCharacterScreen extends StatefulWidget {
  const ChooseCharacterScreen({super.key});

  @override
  State<ChooseCharacterScreen> createState() => _ChooseCharacterScreenState();
}

class _ChooseCharacterScreenState extends State<ChooseCharacterScreen> {
  String choosenCharacter = 'assets/images/game/1.png';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Choose a character',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 34,
                  color: AppColors.white,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                border: GradientBoxBorder(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xCC0084CE),
                      Color(0xCCE317AA),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                  ),
                  width: 5,
                ),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: Image.asset(choosenCharacter)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildButton('assets/images/game/1.png'),
                    _buildButton('assets/images/game/2.png'),
                    _buildButton('assets/images/game/3.png'),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildButton('assets/images/game/4.png'),
                    _buildButton('assets/images/game/5.png'),
                    _buildButton('assets/images/game/6.png'),
                  ],
                ),
              ],
            ),
            ActionButtonWidget(
                text: 'Choose', width: double.infinity, onTap: () {
                  context.router.push(GameRoute(character: choosenCharacter));
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String path) {
    return GestureDetector(
      onTap: () => _onButtonPressed(path),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: GradientBoxBorder(
            gradient: choosenCharacter == path
                ? LinearGradient(
                    colors: [
                      Color(0xCC0084CE),
                      Color(0xCCE317AA),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                  )
                : LinearGradient(
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0x00FFFFFF),
                      Color(0xFFFFFFFF),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
            width: choosenCharacter == path ? 3 : 1.5,
          ),
        ),
        width: MediaQuery.of(context).size.width * 0.28,
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Image.asset(path)),
      ),
    );
  }

  void _onButtonPressed(String path) {
    setState(() {
      choosenCharacter = path;
    });
  }
}
