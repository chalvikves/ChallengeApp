import 'package:stacked/stacked.dart';

class CalendarViewModel extends BaseViewModel {
  DateTime _currentDate = DateTime.now();
  DateTime get currentDate => _currentDate;

  void setCurrentDate(DateTime date) {
    _currentDate = date;
  }
}
