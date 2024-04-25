import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:pulsz_app/router/router.dart';
import 'package:pulsz_app/screens/statistics/bloc/statistics_bloc.dart';
import 'package:pulsz_app/theme/colors.dart';
import 'package:pulsz_app/widgets/app_container.dart';
import 'package:pulsz_app/widgets/custom_icon_button.dart';

class Termix extends StatelessWidget {
  final String usxio;

  const Termix({Key? key, required this.usxio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.arrow_left, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(usxio)),
        ),
      ),
    );
  }
}

@RoutePage()
class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Statistics',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 34,
                  color: AppColors.white,
                ),
              ),
            ),
            SizedBox(height: 15),
            BlocProvider(
              create: (context) => StatisticsBloc()..add(GetStatisticsEvent()),
              child: BlocConsumer<StatisticsBloc, StatisticsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is LoadedStatisticsState) {
                    return AppContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello👋',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            'These are your statistics',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'All Games',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  color: AppColors.grey,
                                ),
                              ),
                              Text(
                                '${state.games}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Victory',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  color: AppColors.grey,
                                ),
                              ),
                              Text(
                                '${state.victory}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Losses',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  color: AppColors.grey,
                                ),
                              ),
                              Text(
                                '${state.losses}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Winning percentage',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  color: AppColors.grey,
                                ),
                              ),
                              Text(
                                '${state.winningPercentage}\%',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
