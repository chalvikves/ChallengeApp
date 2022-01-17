// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../views/calendar.dart' as _i2;
import '../views/home.dart' as _i1;
import '../views/settings.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    Home.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Home());
    },
    CalendarView.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.CalendarView());
    },
    SettingsView.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SettingsView());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(Home.name, path: '/'),
        _i4.RouteConfig(CalendarView.name, path: '/calendar-view'),
        _i4.RouteConfig(SettingsView.name, path: '/settings-view')
      ];
}

/// generated route for
/// [_i1.Home]
class Home extends _i4.PageRouteInfo<void> {
  const Home() : super(Home.name, path: '/');

  static const String name = 'Home';
}

/// generated route for
/// [_i2.CalendarView]
class CalendarView extends _i4.PageRouteInfo<void> {
  const CalendarView() : super(CalendarView.name, path: '/calendar-view');

  static const String name = 'CalendarView';
}

/// generated route for
/// [_i3.SettingsView]
class SettingsView extends _i4.PageRouteInfo<void> {
  const SettingsView() : super(SettingsView.name, path: '/settings-view');

  static const String name = 'SettingsView';
}
