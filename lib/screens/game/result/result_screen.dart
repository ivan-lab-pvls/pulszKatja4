import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pulsz_app/router/router.dart';
import 'package:pulsz_app/theme/colors.dart';
import 'package:pulsz_app/widgets/action_button_widget.dart';
import 'package:pulsz_app/widgets/dialog_container.dart';

@RoutePage()
class ResultScreen extends StatefulWidget {
  final String character;
  final String characterMove;
  final String result;

  const ResultScreen(
      {super.key,
      required this.character,
      required this.characterMove,
      required this.result});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DialogContainer(
                  child: Column(
                    children: [
                      Text(
                        'Player is ${widget.characterMove}',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: AppColors.white),
                      ),
                      Text(
                        '${widget.result}',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: AppColors.white),
                      ),
                      Text(
                        widget.result == 'You Win!'
                            ? 'Congratulations! You have accurately defined the player\'s action, keep up the good work'
                            : 'Unfortunately, you have inaccurately defined the player\'s action, you need to work on it.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                ActionButtonWidget(text: 'Go Next', width: double.infinity, onTap: () {
                  context.router.push(ChooseCharacterRoute());
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
