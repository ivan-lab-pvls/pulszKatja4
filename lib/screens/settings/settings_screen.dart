import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:pulsz_app/router/router.dart';
import 'package:pulsz_app/screens/statistics/statistics_screen.dart';
import 'package:pulsz_app/theme/colors.dart';
import 'package:pulsz_app/widgets/app_container.dart';
import 'package:pulsz_app/widgets/custom_icon_button.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 34,
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width * 0.95,
                child: Stack(
                  children: [
                    AppContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Give us 5 star!',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: AppColors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                width: 150,
                                child: Text(
                                  'Your feedback helps us to improve',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                            'assets/images/settings/settings-image.png'))
                  ],
                ),
              ),
              SizedBox(height: 15),
              AppContainer(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const Termix(
                              usxio:
                                  'https://docs.google.com/document/d/1gcrxhWK1tPahRyEP2reOLqRhQSB13VJg6x0ghgafHcs/edit?usp=sharing',
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Terms & Conditions',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.white,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 20, color: AppColors.white)
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(thickness: .8, color: AppColors.grey50),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const Termix(
                              usxio:
                                  'https://docs.google.com/document/d/1z4Knv-Hv3gTmeYF2gyq61AiXcvf-XCY6iXSeE7GZCUA/edit?usp=sharing',
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Privacy Policy',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.white,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 20, color: AppColors.white)
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(thickness: .8, color: AppColors.grey50),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const Termix(
                              usxio: 'https://forms.gle/JX2FRyT3hXFZzrr67',
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Support Page',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.white,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 20, color: AppColors.white)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              AppContainer(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        InAppReview.instance
                            .openStoreListing(appStoreId: '6499346899');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rate Us',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.white,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 20, color: AppColors.white)
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(thickness: .8, color: AppColors.grey50),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        _share();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Share App',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.white,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 20, color: AppColors.white)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _share() async {
  final deviceData = DeviceInfoPlugin();
  if (Platform.isIOS) {
    final iosDeviceInfo = await deviceData.iosInfo;
    if (iosDeviceInfo.model.contains('iPad')) {
      Share.share(
        'Download Poker pulse game - Find Bluff in AppStore!',
        sharePositionOrigin: Rect.fromLTWH(0, 0, 100, 100),
      );
    } else {
      Share.share(
        'Download Poker pulse game - Find Bluff in AppStore!',
      );
    }
  }
}
