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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      extendBodyBehindAppBar: false,
      drawer: drawerYes(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                      offset: Offset(0, 5))
                ],
                color: Theme.of(context).backgroundColor,
              ),
              padding: const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New challenge every day:',
                          style: GoogleFonts.jost(fontSize: 16.0),
                        ),
                        Switch(
                          value: _challengeEachDaySwitch,
                          onChanged: (value) => setState(() {
                            _challengeEachDaySwitch = !_challengeEachDaySwitch;
                          }),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New challenge every month:',
                          style: GoogleFonts.jost(fontSize: 16.0),
                        ),
                        Switch(
                          value: _challengeEachMonthSwitch,
                          onChanged: (value) => setState(() {
                            _challengeEachMonthSwitch =
                                !_challengeEachMonthSwitch;
                          }),
                        ),
                      ],
                    ),
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

/* 
* Challenge varje dag
* Challenge varje månad
*/ 