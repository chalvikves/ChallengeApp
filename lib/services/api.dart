import 'dart:math';
import 'package:challengeapp/static/challenges.dart';

class Api {
  List<Challenge> get oneDayChallenges => _oneDayChallenges;
  List<Challenge> get monthlyChallenges => _monthlyChallenges;

  Challenge? _currentChallenge;
  Challenge? get currentChallenge => _currentChallenge;
  set currentChallenge(Challenge? challenge) {
    _currentChallenge!.state = ChallengeState.notStarted;
    _currentChallenge = challenge;
  }

  void init() {
    if (!_oneDayChallenges
        .any((element) => element.state == ChallengeState.started)) {
      _currentChallenge = getRandom();
      _currentChallenge!.state = ChallengeState.started;
    } else {
      _currentChallenge = _oneDayChallenges
          .where((element) => element.state == ChallengeState.started)
          .first;
    }
  }

  Challenge? getRandom() {
    return _oneDayChallenges
        .elementAt(Random().nextInt(_oneDayChallenges.length));
  }

  void complete() {
    _currentChallenge!.state = ChallengeState.complete;
  }

  void start() {
    _currentChallenge!.state = ChallengeState.started;
  }

  void stop() {
    _currentChallenge!.state = ChallengeState.stopped;
  }
}

final List<Challenge> _oneDayChallenges = [
  Challenge(
    challenge: 'Eat a fruit',
    category: [],
    difficulty: Difficulty.easy,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Drink 8 glasses of water',
    category: [],
    difficulty: Difficulty.easy,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Meditate for 5-10 minutes',
    category: [],
    difficulty: Difficulty.medium,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Take a 15-minute walk',
    category: [],
    difficulty: Difficulty.easy,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Go for a 20 minute run',
    category: [],
    difficulty: Difficulty.easy,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Listen to your favorite song',
    category: [],
    difficulty: Difficulty.easy,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge:
        'Tell yourself that you are amazing 3 different times during the day',
    category: [],
    difficulty: Difficulty.medium,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Believe in yourself',
    category: [],
    difficulty: Difficulty.medium,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Don\'t eat any sugar today',
    category: [],
    difficulty: Difficulty.medium,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Give someone a complement',
    category: [],
    difficulty: Difficulty.easy,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Write 5 minutes about the largest challenge in your life',
    category: [],
    difficulty: Difficulty.hard,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Read 5 pages in a book',
    category: [],
    difficulty: Difficulty.easy,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Make a new recipe',
    category: [],
    difficulty: Difficulty.easy,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Do something you like',
    category: [],
    difficulty: Difficulty.easy,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Have a coffee with a friend',
    category: [],
    difficulty: Difficulty.easy,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Call a friend and talk for 30 minutes',
    category: [],
    difficulty: Difficulty.medium,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Try yoga for 15 minutes',
    category: [],
    difficulty: Difficulty.hard,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Do some light stretches for 15 minutes',
    category: [],
    difficulty: Difficulty.medium,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Take a cold shower for 2 minutes',
    category: [],
    difficulty: Difficulty.medium,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Clean your room',
    category: [],
    difficulty: Difficulty.easy,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Clean your workspace',
    category: [],
    difficulty: Difficulty.easy,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Donate clothes you don\'t use',
    category: [],
    difficulty: Difficulty.medium,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Clean your closet',
    category: [],
    difficulty: Difficulty.medium,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Write a handwritten letter to someone you care about',
    category: [],
    difficulty: Difficulty.medium,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Go to sleep early',
    category: [],
    difficulty: Difficulty.easy,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Sleep 8 hours this night',
    category: [],
    difficulty: Difficulty.medium,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Learn a new skill on YouTube',
    category: [],
    difficulty: Difficulty.hard,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Make a tea or coffee',
    category: [],
    difficulty: Difficulty.easy,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Listen to a new song',
    category: [],
    difficulty: Difficulty.easy,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Listen to a podcast',
    category: [],
    difficulty: Difficulty.easy,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Research something you want to learn more about',
    category: [],
    difficulty: Difficulty.medium,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Fix your resume',
    category: [],
    difficulty: Difficulty.medium,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Write a letter to your future self',
    category: [],
    difficulty: Difficulty.medium,
    state: ChallengeState.notStarted,
  ),
];

final List<Challenge> _monthlyChallenges = [
  Challenge(
    challenge: 'Buy a new plant and take care of it',
    category: [],
    difficulty: Difficulty.medium,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Read 10 pages every day',
    category: [],
    difficulty: Difficulty.easy,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Don\'t eat sugar for a month',
    category: [],
    difficulty: Difficulty.hard,
    state: ChallengeState.notStarted,
  ),
  Challenge(
    challenge: 'Create a new playlist',
    category: [],
    difficulty: Difficulty.medium,
    state: ChallengeState.notStarted,
  ),
];
