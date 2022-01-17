import 'package:challengeapp/views/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _challengeEachDaySwitch = false;
  bool _challengeEachMonthSwitch = false;
  bool _chooseDaySwitch = false;
  bool _yes = false;
  // ignore: prefer_final_fields
  List<bool> _daysOfWeekChallenge = [
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  final List<String> _daysOfWeek = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      ),
      extendBodyBehindAppBar: false,
      drawer: drawerYes(context),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).cardColor,
                      blurRadius: 20.0,
                      offset: const Offset(0, 10))
                ],
                color: Theme.of(context).backgroundColor,
              ),
              padding: const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const Text('Settings:'),
                    TitleSwitch(
                      switchBool: _challengeEachDaySwitch,
                      title: 'New challenge every day:',
                      onChanged: (val) {
                        setState(() {
                          _challengeEachDaySwitch = !_challengeEachDaySwitch;
                        });
                      },
                    ),
                    TitleSwitch(
                      switchBool: _chooseDaySwitch,
                      title: 'Choose days for a new challenge:',
                      onChanged: (val) {
                        setState(() {
                          _chooseDaySwitch = !_chooseDaySwitch;
                        });
                      },
                    ),
                    _chooseDaySwitch
                        ? Container(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                for (String i in _daysOfWeek)
                                  SizedBox(
                                    width: 40,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: _daysOfWeekChallenge[
                                                _daysOfWeek.indexOf(i)]
                                            ? Colors.blue
                                            : Colors.white,
                                        primary: _daysOfWeekChallenge[
                                                _daysOfWeek.indexOf(i)]
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _daysOfWeekChallenge[
                                                  _daysOfWeek.indexOf(i)] =
                                              !_daysOfWeekChallenge[
                                                  _daysOfWeek.indexOf(i)];
                                        });
                                      },
                                      child: Text(
                                        i,
                                        style: const TextStyle(fontSize: 11),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          )
                        : const SizedBox(
                            height: 0,
                          ),
                    TitleSwitch(
                      switchBool: _challengeEachMonthSwitch,
                      title: 'New challenge every month:',
                      onChanged: (val) {
                        setState(() {
                          _challengeEachMonthSwitch =
                              !_challengeEachMonthSwitch;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            // NEXT CONTAINER
            //
            //
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).cardColor,
                      blurRadius: 20.0,
                      offset: const Offset(0, 10))
                ],
                color: Theme.of(context).backgroundColor,
              ),
              padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const Text('Types of challenges:'),
                    TitleSwitch(
                      switchBool: _yes,
                      title: 'Mindset',
                      onChanged: (val) {
                        setState(() {
                          _yes = !_yes;
                        });
                      },
                    ),
                    TitleSwitch(
                      switchBool: _yes,
                      title: 'Health',
                      onChanged: (val) {
                        setState(() {
                          _yes = !_yes;
                        });
                      },
                    ),
                    TitleSwitch(
                      switchBool: _yes,
                      title: 'Workout',
                      onChanged: (val) {
                        setState(() {
                          _yes = !_yes;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleSwitch extends StatelessWidget {
  TitleSwitch({
    Key? key,
    required this.switchBool,
    required this.title,
    required this.onChanged,
  }) : super(key: key);

  final bool switchBool;
  final String title;
  void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.jost(fontSize: 16.0),
        ),
        Switch(
          value: switchBool,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

/* 
* Challenge varje dag
* Challenge varje månad
*/
