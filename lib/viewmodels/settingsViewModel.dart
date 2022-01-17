import 'package:stacked/stacked.dart';

class SettingsViewModel extends BaseViewModel {
  bool _challengeEachDaySwitch = false;
  bool get challengeEachDaySwitch => _challengeEachDaySwitch;

  bool _challengeEachMonthSwitch = false;
  bool get challengeEachMonthSwitch => _challengeEachMonthSwitch;

  bool _chooseDaySwitch = false;
  bool get chooseDaySwitch => _chooseDaySwitch;

  bool _mindsetSwitch = false;
  bool get mindsetSwitch => _mindsetSwitch;

  void toggleMindset() {
    _mindsetSwitch = !_mindsetSwitch;
    notifyListeners();
  }

  bool _healthSwitch = false;
  bool get healthSwitch => _healthSwitch;

  bool _workoutSwitch = false;
  bool get workoutSwitch => _workoutSwitch;

  void toggleSwitch(bool togSwitch) {
    togSwitch = !togSwitch;
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
}
