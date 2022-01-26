import 'package:challengeapp/global/locator.dart';
import 'package:challengeapp/services/challenge_service.dart';
import 'package:challengeapp/static/challenges.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final _challengeService = locator<ChallengeService>();

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
