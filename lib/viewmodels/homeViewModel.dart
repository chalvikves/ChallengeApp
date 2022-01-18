import 'package:challengeapp/static/challenges.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  Challenges? _challenge;
  Challenge? _currentChallenge;

  void initialise() {
    _challenge = Challenges();
    _currentChallenge = _challenge!.getFirst();
    notifyListeners();
  }

  void stop() {
    _challenge!.stop(_currentChallenge!);
    notifyListeners();
  }

  void start() {
    if (_currentChallenge!.state != ChallengeState.complete) {
      _challenge!.start(_currentChallenge!);
      notifyListeners();
    }
  }

  void newChallenge() {
    _currentChallenge = _challenge!.getRandom();
    notifyListeners();
  }

  void complete() {
    _challenge!.complete(_currentChallenge!);
    notifyListeners();
  }

  Challenge get currentChallenge => _currentChallenge!;
}
