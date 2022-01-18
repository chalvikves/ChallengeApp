import 'package:auto_route/auto_route.dart';
import 'package:challengeapp/global/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget drawerYes(BuildContext context) {
  return Drawer(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            DrawerHeader(
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
              child: SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(
                      flex: 3,
                    ),
                    Row(
                      children: [
                        Text(
                          'Awesome! You have a',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${15}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          ' day streak',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                  ],
                ),
              ),
            ),
            const DrawerRow(
              title: 'Home',
              icon: Icons.house_rounded,
              path: HomeView(),
            ),
            const Divider(),
            const DrawerRow(
              title: 'Calendar',
              icon: Icons.calendar_today_rounded,
              path: CalendarView(),
            ),
            const Divider(),
            const DrawerRow(
              title: 'Settings',
              icon: Icons.settings,
              path: SettingsView(),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
          child: Column(
            children: [
              const Text(
                  'If you like my work and want to support me press the button below <3'),
              ElevatedButton(
                onPressed: () => print('hi'),
                child: const Text('Donate here <3'),
                style: ElevatedButton.styleFrom(primary: Colors.pinkAccent),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

class DrawerRow extends StatelessWidget {
  final String title;
  final IconData? icon;
  final PageRouteInfo path;

  const DrawerRow({
    Key? key,
    required this.title,
    required this.icon,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => AutoRouter.of(context).push(path),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Icon(icon, size: 24),
          const SizedBox(width: 15),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText2,
          )
        ],
      ),
      style: TextButton.styleFrom(primary: Theme.of(context).focusColor),
    );
  }
}
