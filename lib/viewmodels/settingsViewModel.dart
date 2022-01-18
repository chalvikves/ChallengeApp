import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SettingsViewModel extends BaseViewModel {
  bool _challengeEachDaySwitch = true;
  bool get challengeEachDaySwitch => _challengeEachDaySwitch;
  void toggleChallengeDay() {
    _challengeEachDaySwitch = !_challengeEachDaySwitch;
    notifyListeners();
  }

  bool _challengeEachMonthSwitch = false;
  bool get challengeEachMonthSwitch => _challengeEachMonthSwitch;
  void toggleChallengeMonth() {
    _challengeEachMonthSwitch = !_challengeEachMonthSwitch;
    notifyListeners();
  }

  bool _chooseDaySwitch = false;
  bool get chooseDaySwitch => _chooseDaySwitch;
  void toggleChooseDay() {
    _chooseDaySwitch = !_chooseDaySwitch;
    notifyListeners();
  }

  bool _mindsetSwitch = true;
  bool get mindsetSwitch => _mindsetSwitch;
  void toggleMindset() {
    _mindsetSwitch = !_mindsetSwitch;
    notifyListeners();
  }

  bool _healthSwitch = true;
  bool get healthSwitch => _healthSwitch;
  void toggleHealth() {
    _healthSwitch = !_healthSwitch;
    notifyListeners();
  }

  bool _workoutSwitch = true;
  bool get workoutSwitch => _workoutSwitch;
  void toggleWorkout() {
    _workoutSwitch = !_workoutSwitch;
    notifyListeners();
  }

  List<bool> _daysOfWeekChallenge = [
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> get daysOfWeekChallenge => _daysOfWeekChallenge;

  void setDayOfWeek(String i) {
    _daysOfWeekChallenge[_daysOfWeek.indexOf(i)] =
        !_daysOfWeekChallenge[_daysOfWeek.indexOf(i)];
    notifyListeners();
  }

  final List<String> _daysOfWeek = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];
  List<String> get daysOfWeek => _daysOfWeek;
  Map<int, String> get daysOfWeekMap => _daysOfWeek.asMap();
}
