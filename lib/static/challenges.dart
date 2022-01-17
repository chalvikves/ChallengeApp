import 'package:flutter/material.dart';

enum Difficulty { easy, medium, hard }

enum Categories { mindset, health, workout }

class Challenge {
  final String challenge;
  final List<String> category;
  final Difficulty difficulty;
  bool completed;

  Challenge(this.challenge, this.category, this.difficulty, this.completed);

  List<Challenge> get oneDaychallenges => _oneDayChallenges;
  List<Challenge> get monthlyChallenges => _monthlyChallenges;

  void complete(Challenge chall) {
    chall.completed = true;
  }

  final List<Challenge> _oneDayChallenges = [
    Challenge('Eat a fruit', [], Difficulty.easy, false),
    Challenge('Drink 8 glasses of water', [], Difficulty.easy, false),
    Challenge('Meditate for 5-10 minutes', [], Difficulty.medium, false),
    Challenge('Take a 15-minute walk', [], Difficulty.easy, false),
    Challenge('Go for a 20 minute run', [], Difficulty.easy, false),
    Challenge('Listen to your favorite song', [], Difficulty.easy, false),
    Challenge(
        'Tell yourself that you are amazing 3 different times during the day',
        [],
        Difficulty.medium,
        false),
    Challenge('Believe in yourself', [], Difficulty.medium, false),
    Challenge('Don\'t eat any sugar today', [], Difficulty.medium, false),
    Challenge('Give someone a complement', [], Difficulty.easy, false),
    Challenge('Write 5 minutes about the largest challenge in your life', [],
        Difficulty.hard, false),
    Challenge('Read 5 pages in a book', [], Difficulty.easy, false),
    Challenge('Make a new recipe', [], Difficulty.easy, false),
    Challenge('Do something you like', [], Difficulty.easy, false),
    Challenge('Have a coffee with a friend', [], Difficulty.easy, false),
    Challenge(
        'Call a friend and talk for 30 minutes', [], Difficulty.medium, false),
    Challenge('Try yoga for 15 minutes', [], Difficulty.hard, false),
    Challenge(
        'Do some light stretches for 15 minutes', [], Difficulty.medium, false),
    Challenge('Take a cold shower for 2 minutes', [], Difficulty.medium, false),
    Challenge('Clean your room', [], Difficulty.easy, false),
    Challenge('Clean your workspace', [], Difficulty.easy, false),
    Challenge('Donate clothes you don\'t use', [], Difficulty.medium, false),
    Challenge('Clean your closet', [], Difficulty.medium, false),
    Challenge('Write a handwritten letter to someone you care about', [],
        Difficulty.medium, false),
    Challenge('Go to sleep early', [], Difficulty.easy, false),
    Challenge('Sleep 8 hours this night', [], Difficulty.medium, false),
    Challenge('Learn a new skill on YouTube', [], Difficulty.hard, false),
    Challenge('Make a tea or coffee', [], Difficulty.easy, false),
    Challenge('Listen to a new song', [], Difficulty.easy, false),
    Challenge('Listen to a podcast', [], Difficulty.easy, false),
    Challenge('Research something you want to learn more about', [],
        Difficulty.medium, false),
    Challenge('Fix your resume', [], Difficulty.medium, false),
    Challenge(
        'Write a letter to your future self', [], Difficulty.medium, false),
  ];

  final List<Challenge> _monthlyChallenges = [
    Challenge(
        'Buy a new plant and take care of it', [], Difficulty.medium, false),
    Challenge('Read 10 pages every day', [], Difficulty.easy, false),
    Challenge('Don\'t eat sugar for a month', [], Difficulty.hard, false),
    Challenge('Create a new playlist', [], Difficulty.medium, false),
  ];
}
