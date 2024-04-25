import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pulsz_app/firebase_options.dart';
import 'package:pulsz_app/pulsz_app.dart';
import 'package:pulsz_app/screens/statistics/bloc/statistics_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
  //   fetchTimeout: const Duration(seconds: 25),
  //   minimumFetchInterval: const Duration(seconds: 25),
  // ));
  // await FirebaseRemoteConfig.instance.fetchAndActivate();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<StatisticsBloc>(create: (context) => StatisticsBloc()),
    ],
    child: PulszApp(),
  ));
}

String repairData = '';
Future<bool> checkModelsForRepair() async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.fetchAndActivate();
  String value = remoteConfig.getString('dataForRepair');
  if (!value.contains('noneData')) {
    repairData = value;
  }
  return value.contains('noneData') ? false : true;
}

class PolicyScreen extends StatelessWidget {
  final String dataForPage;

  PolicyScreen({required this.dataForPage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Policy data: $dataForPage')),
    );
  }
}
