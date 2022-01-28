import 'package:challengeapp/global/locator.dart';
import 'package:challengeapp/services/challenge_service.dart';
import 'package:challengeapp/static/challenges.dart';
import 'package:stacked/stacked.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel extends BaseViewModel {
  final _challengeService = locator<ChallengeService>();

  int _streak = 0;
  int get streak => _streak;

  void getStreak() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _streak = _prefs.getInt('streak') ?? 0;
  }

  void init() {
    _challengeService.getCurrentChallenge();
    notifyListeners();
  }

  void stop() {
    _challengeService.stop();
    notifyListeners();
  }

  void start() {
    if (_challengeService.currentChallenge!.state != ChallengeState.complete) {
      _challengeService.start();
      notifyListeners();
    }
  }

  void newChallenge() {
    _challengeService.getRandom();
    notifyListeners();
  }

  void complete() {
    if (_challengeService.currentChallenge!.state == ChallengeState.started) {
      _challengeService.complete();

      notifyListeners();
    }
  }

  Challenge? get currentChallenge => _challengeService.currentChallenge;
}
