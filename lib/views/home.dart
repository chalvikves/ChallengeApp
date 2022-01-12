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
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.cyan],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        extendBodyBehindAppBar: true,
        drawer: drawerYes(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0.0),
              child: Center(
                child: Text(
                  'Ta över 10000 steg för det är bra för din hälsa',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            const Spacer(),
            SliderButton(
              action: () => print('working'),
              label: Text(
                'Slide to complete',
                style: GoogleFonts.jost(
                  fontSize: 20.0,
                  color: Colors.grey,
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
              backgroundColor: Colors.white,
              buttonColor: Colors.grey[350]!,
            ),
            const SizedBox(
              height: 100.0,
            )
          ],
        ),
      ),
    );
  }
}
