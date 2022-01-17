import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget drawerYes(BuildContext context) {
  // TODO:
  // * Fix text with theme color to follow darkmode
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      child: Icon(Icons.person),
                      radius: 20,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Viktor Vestlund',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      '@vikves',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${15}',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Text(
                              ' day streak',
                              style: Theme.of(context).textTheme.headline6,
                            )
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Text(
                              '${3}',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Text(
                              ' month streak',
                              style: Theme.of(context).textTheme.headline6,
                            )
                          ],
                        ),
                        const Spacer(),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const DrawerRow(
              title: 'Home',
              icon: Icons.house_rounded,
              path: '/',
            ),
            const Divider(),
            const DrawerRow(
              title: 'Calendar',
              icon: Icons.calendar_today_rounded,
              path: '/calendar',
            ),
            const Divider(),
            const DrawerRow(
              title: 'Settings',
              icon: Icons.settings,
              path: '/settings',
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
  final String path;

  const DrawerRow({
    Key? key,
    required this.title,
    required this.icon,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, path),
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
