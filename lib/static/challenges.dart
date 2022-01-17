import 'package:flutter/material.dart';

enum Difficulty { easy, medium, hard }

enum Categories { mindset, health, workout }

enum State { ongoing, complete, incomplete, notStarted }

class Challenge {
  final String challenge;
  final List<String> category;
  final Difficulty difficulty;
  State state;

  Challenge(this.challenge, this.category, this.difficulty, this.state);

  List<Challenge> get oneDaychallenges => _oneDayChallenges;
  List<Challenge> get monthlyChallenges => _monthlyChallenges;

  void complete(Challenge chall) {
    chall.state = State.complete;
  }

  final List<Challenge> _oneDayChallenges = [
    Challenge('Eat a fruit', [], Difficulty.easy, State.notStarted),
    Challenge(
        'Drink 8 glasses of water', [], Difficulty.easy, State.notStarted),
    Challenge(
        'Meditate for 5-10 minutes', [], Difficulty.medium, State.notStarted),
    Challenge('Take a 15-minute walk', [], Difficulty.easy, State.notStarted),
    Challenge('Go for a 20 minute run', [], Difficulty.easy, State.notStarted),
    Challenge(
        'Listen to your favorite song', [], Difficulty.easy, State.notStarted),
    Challenge(
        'Tell yourself that you are amazing 3 different times during the day',
        [],
        Difficulty.medium,
        State.notStarted),
    Challenge('Believe in yourself', [], Difficulty.medium, State.notStarted),
    Challenge(
        'Don\'t eat any sugar today', [], Difficulty.medium, State.notStarted),
    Challenge(
        'Give someone a complement', [], Difficulty.easy, State.notStarted),
    Challenge('Write 5 minutes about the largest challenge in your life', [],
        Difficulty.hard, State.notStarted),
    Challenge('Read 5 pages in a book', [], Difficulty.easy, State.notStarted),
    Challenge('Make a new recipe', [], Difficulty.easy, State.notStarted),
    Challenge('Do something you like', [], Difficulty.easy, State.notStarted),
    Challenge(
        'Have a coffee with a friend', [], Difficulty.easy, State.notStarted),
    Challenge('Call a friend and talk for 30 minutes', [], Difficulty.medium,
        State.notStarted),
    Challenge('Try yoga for 15 minutes', [], Difficulty.hard, State.notStarted),
    Challenge('Do some light stretches for 15 minutes', [], Difficulty.medium,
        State.notStarted),
    Challenge('Take a cold shower for 2 minutes', [], Difficulty.medium,
        State.notStarted),
    Challenge('Clean your room', [], Difficulty.easy, State.notStarted),
    Challenge('Clean your workspace', [], Difficulty.easy, State.notStarted),
    Challenge('Donate clothes you don\'t use', [], Difficulty.medium,
        State.notStarted),
    Challenge('Clean your closet', [], Difficulty.medium, State.notStarted),
    Challenge('Write a handwritten letter to someone you care about', [],
        Difficulty.medium, State.notStarted),
    Challenge('Go to sleep early', [], Difficulty.easy, State.notStarted),
    Challenge(
        'Sleep 8 hours this night', [], Difficulty.medium, State.notStarted),
    Challenge(
        'Learn a new skill on YouTube', [], Difficulty.hard, State.notStarted),
    Challenge('Make a tea or coffee', [], Difficulty.easy, State.notStarted),
    Challenge('Listen to a new song', [], Difficulty.easy, State.notStarted),
    Challenge('Listen to a podcast', [], Difficulty.easy, State.notStarted),
    Challenge('Research something you want to learn more about', [],
        Difficulty.medium, State.notStarted),
    Challenge('Fix your resume', [], Difficulty.medium, State.notStarted),
    Challenge('Write a letter to your future self', [], Difficulty.medium,
        State.notStarted),
  ];

  final List<Challenge> _monthlyChallenges = [
    Challenge('Buy a new plant and take care of it', [], Difficulty.medium,
        State.notStarted),
    Challenge('Read 10 pages every day', [], Difficulty.easy, State.notStarted),
    Challenge(
        'Don\'t eat sugar for a month', [], Difficulty.hard, State.notStarted),
    Challenge('Create a new playlist', [], Difficulty.medium, State.notStarted),
  ];
}
