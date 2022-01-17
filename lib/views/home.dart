import 'package:challengeapp/views/drawer.dart';
import 'package:challengeapp/views/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _completed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      ),
      extendBodyBehindAppBar: true,
      drawer: drawerYes(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0.0),
            child: Center(
              child: Text(
                'Ta över 10000 steg för det är bra för din hälsa hell\'t',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          const Spacer(),
          _completed
              ? Center(
                  child: Text(
                    'Completed todays challenge! Nice work!',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                )
              : SliderButton(
                  action: () {
                    setState(() {
                      _completed = !_completed;
                    });
                  },
                  label: Text(
                    'Slide to complete',
                    style: GoogleFonts.jost(
                      fontSize: 20.0,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  alignLabel: const Alignment(0.3, 0),
                  icon: const Icon(
                    Icons.check,
                    size: 30,
                    color: Colors.green,
                  ),
                  vibrationFlag: false,
                  shimmer: false,
                  height: 50,
                  buttonSize: 40,
                  backgroundColor: Theme.of(context).focusColor,
                  buttonColor: Theme.of(context).buttonColor,
                ),
          const SizedBox(
            height: 100.0,
          )
        ],
      ),
    );
  }
}
