import 'package:challengeapp/static/themes.dart';
import 'package:challengeapp/views/calendar.dart';
import 'package:challengeapp/views/home.dart';
import 'package:challengeapp/views/settings.dart';
import 'package:flutter/material.dart';

void main() {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter base app',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      home: const Home(),
      routes: <String, WidgetBuilder>{
        '/calendar': (BuildContext context) => const CaledarView(),
        '/settings': (BuildContext context) => const SettingsView(),
      },
    );
  }
}
