import 'package:challengeapp/global/locator.dart';
import 'package:challengeapp/services/api.dart';
import 'package:challengeapp/static/challenges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class ChallengeService {
  final _api = locator<Api>();

  Challenge? _currentChallenge;
  Challenge? get currentChallenge => _currentChallenge;

  void getCurrentChallenge() {
    _api.init();
    _currentChallenge = _api.currentChallenge;
  }

  void getRandom() {
    _currentChallenge = _api.getRandom();

    _api.currentChallenge = _currentChallenge;
  }

  void complete() {
    _api.complete();
  }

  void start() {
    _api.start();
  }

  void stop() {
    _api.stop();
  }

  List<Challenge> getChallenges() {
    return _api.oneDayChallenges;
  }
}
