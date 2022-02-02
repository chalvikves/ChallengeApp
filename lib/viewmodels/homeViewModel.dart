import 'package:challengeapp/global/locator.dart';
import 'package:challengeapp/services/challenge_service.dart';
import 'package:challengeapp/static/challenges.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:hive/hive.dart';

class HomeViewModel extends BaseViewModel {
  final _challengeService = locator<ChallengeService>();
  final _dialogService = locator<DialogService>();
  late final Box box;

  //int _streak = 0;
  int get streak => box.get('streak');

  /*int getStreak() {
    return box.get('streak');
  }*/

  void init() {
    _challengeService.getCurrentChallenge();
    box = Hive.box('challenge');
    //_streak = getStreak();
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
