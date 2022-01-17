import 'package:auto_route/annotations.dart';
import 'package:challengeapp/views/calendar.dart';
import 'package:challengeapp/views/home.dart';
import 'package:challengeapp/views/settings.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: Home, initial: true),
    AutoRoute(page: CalendarView),
    AutoRoute(page: SettingsView),
  ],
)
class $AppRouter {}
