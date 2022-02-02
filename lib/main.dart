import 'dart:io';

import 'package:challengeapp/global/locator.dart';
import 'package:challengeapp/global/router.gr.dart';
import 'package:challengeapp/static/themes.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box box;
Future<void> main() async {
  setupLocator();
  await Hive.initFlutter();
  box = await Hive.openBox('challenge');
  box.put('streak', 1);
  //Hive.registerAdapter(ChallengeAdapter());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Challenge App',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      routerDelegate: _router.delegate(),
      routeInformationParser: _router.defaultRouteParser(),
    );
  }
}
