import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  bool _completed = false;
  bool get completed => _completed;

  void toggleCompleted() {
    _completed = !_completed;
    notifyListeners();
  }
}
