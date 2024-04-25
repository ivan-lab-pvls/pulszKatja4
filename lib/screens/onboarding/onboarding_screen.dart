import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pulsz_app/router/router.dart';
import 'package:pulsz_app/theme/colors.dart';
import 'package:pulsz_app/widgets/action_button_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/onboarding/onboarding-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.85,
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == 1;
                  });
                },
                controller: controller,
                children: [
                  Stack(
                    children: [
                      Image.asset('assets/images/onboarding/1.png'),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.bgDark,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(35.0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(35.0),
                                bottomLeft: Radius.circular(0)),
                          ),
                          height: MediaQuery.of(context).size.height * 0.37,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  'Bluff your opponents by their heart rate!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 28,
                                      color: AppColors.white),
                                ),
                              ),
                              SizedBox(height: 15),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.85,
                                child: Text(
                                  'Observe the digital display of your opponent\'s pulse and heartbeat, make decisions based on your observations and theirs. Good luck at the poker table!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                      color: AppColors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Image.asset('assets/images/onboarding/2.png'),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.bgDark,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(35.0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(35.0),
                                bottomLeft: Radius.circular(0)),
                          ),
                          height: MediaQuery.of(context).size.height * 0.37,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  'Every move is a real strategy!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 28,
                                      color: AppColors.white),
                                ),
                              ),
                              SizedBox(height: 15),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.85,
                                child: Text(
                                  'Get ready for an exciting game where your decisions determine the outcome of the game. Watch the pulse and guess who is the real poker master here!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                      color: AppColors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: AppColors.bgDark,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ActionButtonWidget(
                      text: 'Continue',
                      width: MediaQuery.of(context).size.width * 0.85,
                      onTap: () {
                        isLastPage ? context.router.push(HomeRoute()) :
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      }),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 2,
                    effect: WormEffect(
                      activeDotColor: AppColors.pink,
                      dotColor: AppColors.grey,
                      dotHeight: 4,
                      dotWidth: MediaQuery.of(context).size.width * 0.1,
                      radius: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
