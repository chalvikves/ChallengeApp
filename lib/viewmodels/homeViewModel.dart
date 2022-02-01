import 'package:challengeapp/global/locator.dart';
import 'package:challengeapp/services/challenge_service.dart';
import 'package:challengeapp/static/challenges.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _challengeService = locator<ChallengeService>();
  final _dialogService = locator<DialogService>();

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

  Future callDialog() async {
    DialogResponse? response = await _dialogService.showDialog(
      title: 'Hi',
      description: 'Hi',
      cancelTitle: 'Cancel',
      cancelTitleColor: Colors.red,
      buttonTitleColor: Colors.green,
    );
  }

  Challenge? get currentChallenge => _challengeService.currentChallenge;
}
