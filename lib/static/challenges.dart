import 'package:flutter/material.dart';

enum Difficulty { easy, medium, hard }

enum Categories { mindset, health, workout }

class Challenge {
  final String challenge;
  final List<String> category;
  final Difficulty difficulty;

  Challenge(this.challenge, this.category, this.difficulty);

  List<Challenge> get oneDaychallenges => _oneDayChallenges;
  List<Challenge> get monthlyChallenges => _monthlyChallenges;

  final List<Challenge> _oneDayChallenges = [
    Challenge('Eat a fruit', [], Difficulty.easy),
    Challenge('Drink 8 glasses of water', [], Difficulty.easy),
    Challenge('Meditate for 5-10 minutes', [], Difficulty.medium),
    Challenge('Take a 15-minute walk', [], Difficulty.easy),
    Challenge('Go for a 20 minute run', [], Difficulty.easy),
    Challenge('Listen to your favorite song', [], Difficulty.easy),
    Challenge(
        'Tell yourself that you are amazing 3 different times during the day',
        [],
        Difficulty.medium),
    Challenge('Believe in yourself', [], Difficulty.medium),
    Challenge('Don\'t eat any sugar today', [], Difficulty.medium),
    Challenge('Give someone a complement', [], Difficulty.easy),
    Challenge('Write 5 minutes about the largest challenge in your life', [],
        Difficulty.hard),
    Challenge('Read 5 pages in a book', [], Difficulty.easy),
    Challenge('Make a new recipe', [], Difficulty.easy),
    Challenge('Do something you like', [], Difficulty.easy),
    Challenge('Have a coffee with a friend', [], Difficulty.easy),
    Challenge('Call a friend and talk for 30 minutes', [], Difficulty.medium),
    Challenge('Try yoga for 15 minutes', [], Difficulty.hard),
    Challenge('Do some light stretches for 15 minutes', [], Difficulty.medium),
    Challenge('Take a cold shower for 2 minutes', [], Difficulty.medium),
    Challenge('Clean your room', [], Difficulty.easy),
    Challenge('Clean your workspace', [], Difficulty.easy),
    Challenge('Donate clothes you don\'t use', [], Difficulty.medium),
    Challenge('Clean your closet', [], Difficulty.medium),
    Challenge('Write a handwritten letter to someone you care about', [],
        Difficulty.medium),
    Challenge('Go to sleep early', [], Difficulty.easy),
    Challenge('Sleep 8 hours this night', [], Difficulty.medium),
    Challenge('Learn a new skill on YouTube', [], Difficulty.hard),
    Challenge('Make a tea of coffee', [], Difficulty.easy),
    Challenge('Listen to a new song', [], Difficulty.easy),
    Challenge('Listen to a podcast', [], Difficulty.easy),
    Challenge('Research something you want to learn more about', [],
        Difficulty.medium),
    Challenge('Fix your resume', [], Difficulty.medium),
    Challenge('Write a letter to your future self', [], Difficulty.medium),
  ];

  final List<Challenge> _monthlyChallenges = [
    Challenge('Buy a new plant and take care of it', [], Difficulty.medium),
    Challenge('Read 10 pages every day', [], Difficulty.easy),
    Challenge('Don\'t eat sugar for a month', [], Difficulty.hard),
    Challenge('Create a new playlist', [], Difficulty.medium),
  ];
}
